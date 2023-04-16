class TicketStoragePageQueryParams {
  late final String? ticketId;
  late final bool isError;

  TicketStoragePageQueryParams({
    required this.ticketId,
    required this.isError,
  });

  TicketStoragePageQueryParams.fromParamsMap(Map<String, dynamic> data) {
    ticketId = data["ticketId"];
    isError = data["isError"];
  }

  Map<String, dynamic> toParamsMap() {
    return {
      "ticketId": ticketId,
      "isError": isError,
    };
  }

  @override
  String toString() {
    return "TicketStoragePageQueryParams: ${toParamsMap()}";
  }
}
