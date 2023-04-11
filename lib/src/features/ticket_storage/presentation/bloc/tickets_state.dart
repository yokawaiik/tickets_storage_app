part of 'tickets_bloc.dart';

@immutable
abstract class TicketsState extends Equatable {}

class InitialTicketsState extends TicketsState {
  @override
  List<Object?> get props => [];
}

class LoadedTicketsState extends TicketsState {
  final List<Ticket> loadedTickets;

  LoadedTicketsState(this.loadedTickets);

  @override
  List<Object?> get props => [loadedTickets];
}

class AddedSingleTicketsState extends TicketsState {
  final Ticket ticket;

  AddedSingleTicketsState(this.ticket);

  @override
  List<Object?> get props => [ticket];
}

class RemovedSingleTicketsState extends TicketsState {
  final Ticket removedTicket;

  RemovedSingleTicketsState(this.removedTicket);

  @override
  List<Object?> get props => [removedTicket];
}

class RemovedGroupTicketsState extends TicketsState {
  final List<Ticket> deletedTickets;

  RemovedGroupTicketsState(this.deletedTickets);

  @override
  List<Object?> get props => [deletedTickets];
}

class ErrorTicketsState extends TicketsState {
  final Object? error;

  ErrorTicketsState([this.error = "Something went wrong."]);

  @override
  List<Object?> get props => [error];
}

class DownloadSingleTicketsState extends TicketsState {
  final Ticket? ticket;

  DownloadSingleTicketsState(this.ticket);

  @override
  List<Object?> get props => [ticket];
}
