import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  // final String name;
  late final String id;
  late final String fileUrl;
  String? filePath;

  Ticket({
    // required this.name,
    required this.id,
    required this.fileUrl,
    required this.filePath,
  });

  Ticket.preview({
    // required this.name,
    required this.fileUrl,
  });

  void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  @override
  List<Object?> get props => [fileUrl, filePath];
}
