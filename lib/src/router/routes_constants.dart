const ticketsPage = "Tickets";
const ticketsPagePath = "/tickets";

const ticketDetailPage = "Ticket Detail Page";
const ticketDetailPagePath = "/ticket/overview";
const ticketDetailPageQueryParamIdPath = "id";

class TicketDetailPageQueryParams {
  late final String id;

  TicketDetailPageQueryParams({
    required this.id,
  });

  TicketDetailPageQueryParams.fromParamsMap(Map<String, dynamic> data) {
    id = data["id"];
  }

  Map<String, dynamic> toParamsMap() {
    return {
      "id": id,
    };
  }

  @override
  String toString() {
    return "TicketDetailPageQueryParams: ${toParamsMap()}";
  }
}
