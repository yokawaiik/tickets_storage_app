import 'dart:async';

import 'package:documents_saver_app/src/features/ticket_storage/domain/enums/error_situation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../bloc/tickets_bloc.dart';
import '../widgets/widgets.dart';
import '../../utils/utils.dart' as utils;

class TicketStoragePage extends StatefulWidget {
  const TicketStoragePage({
    Key? key,
  }) : super(key: key);

  @override
  State<TicketStoragePage> createState() => _TicketStoragePageState();
}

class _TicketStoragePageState extends State<TicketStoragePage> {
  late final TicketsBloc _ticketsBloc;
  late final TextEditingController _ticketUrlTextFieldController;
  late final GlobalKey<FormState> _addFormKey;
  late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _ticketsBloc = GetIt.I.get<TicketsBloc>();
    _ticketsBloc..add(GetTicketsEvent(inital: true));
    _ticketUrlTextFieldController = TextEditingController();
    _addFormKey = GlobalKey<FormState>();
    _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    _scrollController = ScrollController();

    _scrollController.addListener(() async {
      debugPrint("_TicketStoragePageState - _scrollController.addListener");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_ticketsBloc.tickets.length != _ticketsBloc.totalCountTickets) {
          _ticketsBloc.add(GetTicketsEvent());
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _ticketsBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketsBloc, TicketsState>(
      bloc: _ticketsBloc,
      listener: (context, state) {
        late final String message;

        if (state is ErrorTicketsState) {
          message = state.error.toString();
        } else if (state is RemovedSingleTicketsState) {
          message = "Was deleted: ${state.removedTicket.fileUrl}";
        } else {
          message = "Something went wrong.";
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
        if ((current is ErrorTicketsState &&
                current.errorSituation == ErrorSituation.tickets) ||
            current is RemovedSingleTicketsState) {
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
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: BlocBuilder<TicketsBloc, TicketsState>(
            bloc: _ticketsBloc,
            buildWhen: (previous, current) {
              if (previous == current) return false;
              if (current is AddedSingleTicketsState ||
                  current is RemovedSingleTicketsState ||
                  current is RemovedGroupTicketsState ||
                  current is LoadedTicketsState) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              if (state is InitialTicketsState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (_ticketsBloc.tickets.isEmpty) {
                return const Center(
                  child: Text("There are no tickets here."),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: _ticketsBloc.tickets.length + 1,
                itemBuilder: (_, index) {
                  if (index == _ticketsBloc.tickets.length) {
                    if (_ticketsBloc.tickets.length ==
                        _ticketsBloc.totalCountTickets) {
                      return const SizedBox(
                        height: 40,
                        child: Center(child: Text("There is nothing more...")),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Align(
                        child: Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    );
                  }

                  final ticket = _ticketsBloc.tickets[index];

                  return ListTicketItemWidget(
                    key: Key(ticket.hashCode.toString()),
                    ticket: ticket,
                    title: "Ticket ${ticket.id}",
                    subtitleFileDownloaded: "Файл загружен",
                    subtitleFileDownloading: "Загрузка",
                    subtitleFileDownload: "Ожидает начала загрузки",
                    subtitleFileError: "Ошибка при загрузке",
                    scaffoldMessengerKey: _scaffoldMessengerKey,
                    // todo: add function with callback with getting progress
                    // onPressedDownload: () {

                    //   // _ticketsBloc.add(
                    //   //   DownloadSingleTicketEvent(ticket: ticket),
                    //   // );
                    //   // return _ticketsBloc.
                    // },
                    onDismissed: () {
                      _ticketsBloc.add(
                        DeletedTicketEvent(id: ticket.id),
                      );
                    },
                  );
                },
              );
            },
          ),
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
        _ticketUrlTextFieldController.text = clipboardData.text!;
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
        return WillPopScope(
          onWillPop: () async {
            _ticketUrlTextFieldController.text = "";
            return true;
          },
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
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
                          labelText: "PDF file url",
                          controller: _ticketUrlTextFieldController,
                          validator: (value) => utils.checkFileUrl(value),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: _ticketUrlTextFieldController
                                      .text.isEmpty ||
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
          ),
        );
      },
    );
  }

  void addTicket() {
    _ticketsBloc
        .add(AddTicketEvent(fileUrl: _ticketUrlTextFieldController.text));

    _scaffoldMessengerKey.currentContext!.pop();
  }

  Future<void> _refresh() async {
    final completer = Completer();
    _ticketsBloc.add(RefreshTicketsEvent(completer));
    return completer.future;
  }
}
