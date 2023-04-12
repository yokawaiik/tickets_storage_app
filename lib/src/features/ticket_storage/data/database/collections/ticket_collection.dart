import 'package:isar/isar.dart';
import '../database_constants.dart' as database_constants;

part "ticket_collection.g.dart";

@Collection()
class TicketCollection {
  @Index(
    name: database_constants.keyIndexName,
    type: IndexType.value,
    replace: false,
    unique: true,
  )
  final Id key = Isar.autoIncrement;

  @Index(
    name: database_constants.idIndexName,
    type: IndexType.hash,
    replace: false,
    unique: true,
  )
  late final String id;

  @Index(
    name: database_constants.fileUrlIndexName,
    type: IndexType.hash,
    replace: false,
    unique: true,
  )
  late String fileUrl;
  String? filePath;

  TicketCollection({
    required this.id,
    required this.fileUrl,
    this.filePath,
  });
}
