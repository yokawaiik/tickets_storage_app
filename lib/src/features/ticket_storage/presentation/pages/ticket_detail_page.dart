import 'package:documents_saver_app/src/features/ticket_storage/presentation/bloc/tickets_bloc.dart';
import 'package:documents_saver_app/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get_it/get_it.dart';

import '../../domain/enums/error_situation.dart';

class TicketDetailPage extends StatefulWidget {
  final TicketDetailPageQueryParams queryParams;

  const TicketDetailPage({
    super.key,
    required this.queryParams,
  });

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  late final TicketsBloc _ticketsBloc;

  @override
  void initState() {
    debugPrint("queryParams: ${widget.queryParams}");
    _ticketsBloc = GetIt.I.get<TicketsBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(
      bloc: _ticketsBloc..add(GetSingleTicketsEvent(widget.queryParams.id)),
      buildWhen: (previous, current) {
        if (previous == current) return false;

        if (current is LoadedSingleTicketState ||
            (current is ErrorTicketsState &&
                current.errorSituation == ErrorSituation.ticket)) {
          return true;
        }

        return false;
      },
      builder: (context, state) {
        if (state is ErrorTicketsState) {
          return Center(
            child: Text(
              state.error.toString(),
            ),
          );
        }

        if (state is! LoadedSingleTicketState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          appBar: AppBar(),
          body: PDFView(
            filePath: state.ticket.filePath,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
          ),
        );
      },
    );
  }
}
