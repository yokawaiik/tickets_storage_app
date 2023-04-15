import '../enums/ticket_exception_code.dart';

class TicketsException implements Exception {
  final String message;
  final TicketExceptionCode ticketExceptionCode;
  TicketsException([
    this.message = "Something went wrong...",
    this.ticketExceptionCode = TicketExceptionCode.any,
  ]);

  @override
  String toString() {
    return message.toString();
  }
}
