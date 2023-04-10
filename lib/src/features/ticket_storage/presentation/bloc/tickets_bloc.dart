import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/models/ticket.dart';
import '../../domain/repository/tickets_repository.dart';

part 'tickets_event.dart';
part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  late final TicketsRepository _ticketsRepository;

  TicketsBloc() : super(TicketsInitialState()) {
    _ticketsRepository = TicketsRepository();

    on<GetTicketsEvent>((event, emit) async {
      try {
        final tickets = await _ticketsRepository.getTicketList(
          event.limit,
          event.offset,
        );

        _tickets.addAll(tickets);

        emit(TicketsLoadedState(_tickets));
      } catch (e) {
        emit(TicketsErrorState(e));
      }
    });
    on<AddTicketEvent>((event, emit) async {
      try {
        final addedTicket = await _ticketsRepository.addTicket(event.fileUrl);

        _tickets.add(addedTicket!);

        emit(TicketsAddedState(_tickets));
      } catch (e) {
        emit(TicketsErrorState(e));
      }
    });
    on<DeletedTicketEvent>((event, emit) async {
      try {
        await _ticketsRepository.removeTicket(event.id);

        final ticket = _tickets.firstWhere((ticket) => ticket.id == event.id);

        _tickets.removeWhere((ticket) => ticket.id == event.id);

        emit(RemovedTicketState(ticket));
      } catch (e) {
        emit(TicketsErrorState(e));
      }
    });
    on<DeletedGroupTicketsEvent>((event, emit) async {
      try {
        await _ticketsRepository.removeGroupTickets(event.idList);

        _tickets.removeWhere((ticket) => event.idList.contains(ticket.id));

        emit(TicketsRemovedState(_tickets));
      } catch (e) {
        emit(TicketsErrorState(e));
      }
    });
    on<RefreshTicketsEvent>((event, emit) async {
      try {
        final tickets = await _ticketsRepository.getTicketList(
          10,
          0,
        );

        _tickets.addAll(tickets);

        emit(TicketsAddedState(_tickets));
      } catch (e) {
        emit(TicketsErrorState(e));
      }
    });
    on<DownloadTicketEvent>((event, emit) async {
      try {
        final ticketWithFilePath =
            await _ticketsRepository.downloadTicketFile(event.ticket);

        await _ticketsRepository.updateTicket(ticketWithFilePath);

        print(event.ticket.filePath);

        _tickets
            .firstWhere((element) => element.id == ticketWithFilePath.id)
            .filePath = ticketWithFilePath.filePath;

        emit(DownloadTicketState(ticketWithFilePath));
      } catch (e) {
        emit(TicketsErrorState(e));
      }
    });
  }
}
