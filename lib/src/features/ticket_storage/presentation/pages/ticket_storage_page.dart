import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/tickets_bloc.dart';
import '../widgets/widgets.dart';
import '../../utils/utils.dart' as utils;

class TicketStoragePage extends StatelessWidget {
  final TicketsBloc ticketsBloc;

  final ticketUrlTextFieldController = TextEditingController();
  final _addFormKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  TicketStoragePage({
    Key? key,
    required this.ticketsBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketsBloc, TicketsState>(
      bloc: ticketsBloc,
      listener: (context, state) {
        late final String message;
        if (state is TicketsErrorState) {
          message = state.error.toString();
        } else if (state is RemovedTicketState) {
          message = "Was deleted: ${state.deletedTicket.fileUrl}";
        } else {
          message = "Something went wrong";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
          ),
        );
      },
      listenWhen: (previous, current) {
        if (current is TicketsErrorState || current is RemovedTicketState) {
          return true;
        }
        return false;
      },
      child: Scaffold(
        key: _scaffoldMessengerKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Хранение билетов"),
        ),
        body: BlocBuilder<TicketsBloc, TicketsState>(
          bloc: ticketsBloc..add(GetTicketsEvent(limit: 10, offset: 0)),
          buildWhen: (previous, current) {
            if (current is TicketsAddedState ||
                current is TicketsRemovedState ||
                current is TicketsLoadedState ||
                current is RefreshTicketsEvent) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state.ticketList.isEmpty) {
              return const Center(
                child: Text("Здесь пока ничего нет"),
              );
            }

            return RefreshIndicator(
              onRefresh: () async => ticketsBloc.add(RefreshTicketsEvent()),
              child: ListView.builder(
                itemCount: ticketsBloc.tickets.length,
                itemBuilder: (_, index) {
                  final ticket = state.ticketList[index];

                  return ListTicketItemWidget(
                    key: Key(ticket.id.toString()),
                    ticket: ticket,
                    title: "Ticket ${ticket.id}",
                    subtitle: "Ожидает начала загрузки",
                    onPressedDownload: () =>
                        ticketsBloc.add(DownloadTicketEvent(ticket: ticket)),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd ||
                          direction == DismissDirection.endToStart) {
                        ticketsBloc.add(DeletedTicketEvent(id: ticket.id));
                      }
                    },
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addLink,
          label: const Text("Добавить"),
        ),
      ),
    );
  }

  void _addLink() async {
    final clipboardData = await Clipboard.getData('text/plain');

    if (clipboardData?.text != null) {
      final isValidPdf = utils.checkFileUrl(clipboardData!.text);

      if (isValidPdf == null) {
        ticketUrlTextFieldController.text = clipboardData.text!;
        // todo: add SnackBar on ModalBottomSheet
        // ScaffoldMessenger.of(_nestedScaffoldMessengerKey.currentContext!)
        //     .showSnackBar(
        //   const SnackBar(
        //     content: Text("Ссылка на билет добавлена"),
        //   ),
        // );
      }
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: _scaffoldMessengerKey.currentContext!,
      isDismissible: true,
      enableDrag: true,
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _addFormKey,
                onChanged: () {
                  _addFormKey.currentState?.save();
                  _addFormKey.currentState?.validate();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 20,
                    left: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      DefaultTextField(
                        controller: ticketUrlTextFieldController,
                        validator: (value) => utils.checkFileUrl(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: ticketUrlTextFieldController.text.isEmpty ||
                                _addFormKey.currentState?.validate() == false
                            ? null
                            : () => addTicket(),
                        child: const Text('Добавить'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void addTicket() {
    ticketsBloc.add(AddTicketEvent(fileUrl: ticketUrlTextFieldController.text));

    _scaffoldMessengerKey.currentContext!.pop();
  }
}
