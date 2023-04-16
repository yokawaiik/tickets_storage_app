import 'dart:io';

import 'package:path/path.dart' show basename;
import 'package:path_provider/path_provider.dart';

Future<String> getPathToFile(fileUrl) async {
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final fileName = basename(fileUrl);
  final saveFilePath = '${appDocumentsDir.path}/$fileName';
  return saveFilePath;
}
