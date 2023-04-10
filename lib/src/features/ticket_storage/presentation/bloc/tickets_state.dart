part of 'tickets_bloc.dart';

@immutable
abstract class TicketsState extends Equatable {
  final List<Ticket> ticketList = [];
}

class TicketsInitialState extends TicketsState {
  @override
  final List<Ticket> ticketList = [];

  @override
  List<Object?> get props => [ticketList];
}

class TicketsLoadedState extends TicketsState {
  @override
  final List<Ticket> ticketList;

  TicketsLoadedState(this.ticketList);

  @override
  List<Object?> get props => [ticketList];
}

class TicketsAddedState extends TicketsState {
  @override
  final List<Ticket> ticketList;

  TicketsAddedState(this.ticketList);

  @override
  List<Object?> get props => [ticketList];
}

class TicketsRemovedState extends TicketsState {
  @override
  final List<Ticket> ticketList;

  TicketsRemovedState(this.ticketList);

  @override
  List<Object?> get props => [ticketList];
}

class RemovedTicketState extends TicketsState {
  final Ticket deletedTicket;

  RemovedTicketState(this.deletedTicket);

  @override
  List<Object?> get props => [deletedTicket];
}

class TicketsErrorState extends TicketsState {
  final Object? error;

  TicketsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class DownloadTicketState extends TicketsState {
  final Ticket? ticket;

  DownloadTicketState(this.ticket);

  @override
  List<Object?> get props => [ticket];
}
