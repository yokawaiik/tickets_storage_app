import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  late final String id;
  late final String fileUrl;
  String? filePath;

  bool isSelected;

  Ticket({
    required this.id,
    required this.fileUrl,
    required this.filePath,
    this.isSelected = false,
  });

  void setSelection(bool selection) {
    isSelected = selection;
  }

  void setFilePath(String? filePath) {
    this.filePath = filePath;
  }

  @override
  String toString() {
    return "Ticket - id: $id - fileUrl: $fileUrl - filePath: $filePath - isSelected: $isSelected.";
  }

  @override
  List<Object?> get props => [fileUrl, filePath];
}
