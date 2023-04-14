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
