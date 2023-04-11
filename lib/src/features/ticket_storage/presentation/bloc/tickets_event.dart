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

class RefreshTicketsEvent implements TicketsEvent {
  final Completer? completer;
  RefreshTicketsEvent(this.completer);
}

class DownloadSingleTicketEvent implements TicketsEvent {
  final Ticket ticket;

  DownloadSingleTicketEvent({required this.ticket});
}

class DeletedTicketEvent implements TicketsEvent {
  final String id;

  DeletedTicketEvent({required this.id});
}

class DeletedGroupTicketsEvent implements TicketsEvent {
  final List<Ticket> tickets;

  DeletedGroupTicketsEvent({required this.tickets});
}
