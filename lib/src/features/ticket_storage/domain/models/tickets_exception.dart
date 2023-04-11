class TicketsException implements Exception {
  final String message;
  TicketsException([this.message = "Something went wrong"]);

  @override
  String toString() {
    return message.toString();
  }
}
