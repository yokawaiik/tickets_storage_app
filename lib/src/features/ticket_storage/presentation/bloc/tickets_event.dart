part of 'tickets_bloc.dart';

@immutable
abstract class TicketsEvent {}

class AddTicketEvent implements TicketsEvent {
  // final String name;
  final String fileUrl;

  AddTicketEvent({
    // required this.name,
    required this.fileUrl,
  });
}

class GetTicketsEvent implements TicketsEvent {
  final int limit;
  final int offset;

  GetTicketsEvent({
    required this.limit,
    required this.offset,
  });
}

class RefreshTicketsEvent implements TicketsEvent {}

class DownloadTicketEvent implements TicketsEvent {
  final Ticket ticket;

  DownloadTicketEvent({required this.ticket});
}

class DeletedTicketEvent implements TicketsEvent {
  final String id;

  DeletedTicketEvent({required this.id});
}

class DeletedGroupTicketsEvent implements TicketsEvent {
  final List<String> idList;

  DeletedGroupTicketsEvent({required this.idList});
}
