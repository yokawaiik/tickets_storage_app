import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:documents_saver_app/src/features/ticket_storage/domain/models/tickets_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:isar/isar.dart';
import 'package:nanoid/nanoid.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/database/tickets_storage_helper.dart';
import '../models/ticket.dart';

import 'package:path/path.dart' as path;

class FileManagerRepository {
  late final TicketStorageHelper _ticketStorage;
  late final DownloadManager _dm;

  FileManagerRepository() {
    _ticketStorage = TicketStorageHelper.instance;
    _dm = DownloadManager();
    // _dio = Dio();
  }

  Future<void> updateTicket(Ticket ticket) async {
    try {
      await _ticketStorage.updateTicket(ticket);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  Future<DownloadTask?> downloadTicketFile(
    Ticket ticket,
    Function completeCallback,
    Function errorCallback,
  ) async {
    try {
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      final fileName = path.basename(ticket.fileUrl);

      final saveFilePath = '${appDocumentsDir.path}/$fileName';

      // todo: check it

      final task = await _dm.addDownload(ticket.fileUrl, saveFilePath);

      // task.catchError(onErrorCallback);

      // task.whenComplete(onErrorCallback);

      if (task == null) {
        throw TicketsException(
            "Can't download the file from address: ${ticket.fileUrl}.");
      }

      // if (onReceiveProgressCallback != null) {
      //   await task.whenDownloadComplete(timeout: const Duration(minutes: 5));
      //   task.progress.addListener(
      //     () async {
      //       ticket.setFilePath(saveFilePath);
      //       await updateTicket(ticket);
      //     },
      //   );

      //   onReceiveProgressCallback(task);
      // } else {
      //   ticket.setFilePath(saveFilePath);
      //   await updateTicket(ticket);
      // }

      task.whenDownloadComplete(timeout: const Duration(minutes: 5));
      task.progress.addListener(
        () async {
          ticket.setFilePath(saveFilePath);
          await updateTicket(ticket);
        },
      );

      return task;
    } on TicketsException catch (_) {
      errorCallback();
    } catch (e) {
      debugPrint(
        "FileManagerRepository - downloadTicketFile - ${e.toString()}",
      );

      // throw Exception("Something went wrong.");
      errorCallback();
    }
  }
}
