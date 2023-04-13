part of 'tickets_bloc.dart';

@immutable
abstract class TicketsEvent {}

class AddTicketEvent implements TicketsEvent {
  final String fileUrl;

  AddTicketEvent({
    required this.fileUrl,
  });
}

class GetTicketsEvent implements TicketsEvent {
  final bool inital;
  GetTicketsEvent({this.inital = false});
}

class GetSingleTicketsEvent implements TicketsEvent {
  final String id;
  GetSingleTicketsEvent(this.id);
}

class RefreshTicketsEvent implements TicketsEvent {
  final Completer? completer;
  RefreshTicketsEvent(this.completer);
}

class DeletedTicketEvent implements TicketsEvent {
  final String id;

  DeletedTicketEvent({required this.id});
}

class SetSelectionSingleTicketsEvent implements TicketsEvent {
  final Ticket ticket;
  final bool selection;

  SetSelectionSingleTicketsEvent({
    required this.ticket,
    required this.selection,
  });
}

class ResetSelectionTicketsEvent implements TicketsEvent {}

class RemoveSelectedTicketsEvent implements TicketsEvent {}
