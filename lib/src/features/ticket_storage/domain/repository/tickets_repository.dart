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

class TicketsRepository {
  late final TicketStorageHelper _ticketStorage;
  // late final Dio _dio;
  late final DownloadManager _dm;

  TicketsRepository() {
    _ticketStorage = TicketStorageHelper.instance;
    _dm = DownloadManager();
    // _dio = Dio();
  }

  Future<int> getTotalCountTickets() async {
    try {
      final count = await _ticketStorage.getTotalCountTickets();
      return count;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  Future<List<Ticket>> getTicketList(int limit, int offset) async {
    try {
      final tickets = await _ticketStorage.getTicketList(limit, offset);

      return tickets;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  Future<Ticket?> addTicket(String fileUrl) async {
    try {
      await _ticketStorage.addTicket(fileUrl, nanoid().toUpperCase());

      final addedTicket = await _ticketStorage.getTicket(fileUrl);

      if (addedTicket == null) {
        throw Exception("Ticket wasn't added.");
      }

      return addedTicket;
    } on IsarError catch (e) {
      debugPrint("TicketsRepository - addTicket - IsarError - e: $e");
      late final String msg;
      if (e.message
          .toLowerCase()
          .contains("Unique index violated.".toLowerCase())) {
        msg = "Such link has already been saved.";
      } else {
        msg = 'Something went wrong';
      }

      throw TicketsException(msg);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  Future<Ticket?> updateTicket(Ticket ticket) async {
    try {
      await _ticketStorage.updateTicket(ticket);

      final addedTicket = await _ticketStorage.getTicket(ticket.fileUrl);

      if (addedTicket == null) {
        throw Exception("Ticket wasnt't updated.");
      }

      return addedTicket;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  Future<void> removeTicket(Ticket ticket) async {
    try {
      await _ticketStorage.removeTicket(ticket.id);
      if (ticket.filePath != null) {
        await File(ticket.filePath!).delete();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  Future<void> removeGroupTickets(List<Ticket> tickets) async {
    try {
      await _ticketStorage
          .removeGroupTickets(tickets.map((t) => t.id).toList());
      for (final ticket in tickets) {
        if (ticket.filePath != null) {
          await File(ticket.filePath!).delete();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  // Future<List<Ticket>> removeTickets(List<Ticket> tickets) async {}

  Future<Ticket> downloadTicketFile(
    Ticket ticket,
    DownloadTask Function(DownloadTask)? onReceiveProgressCallback,
  ) async {
    try {
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      final fileName = path.basename(ticket.fileUrl);

      final saveFilePath = '${appDocumentsDir.path}/$fileName';

      // todo: check it
      // _dio
      //     .download(
      //       ticket.fileUrl,
      //       saveFilePath,
      //       onReceiveProgress: onReceiveProgressCallback,
      //     )
      //     .asStream();
      final task = await _dm.addDownload(ticket.fileUrl, saveFilePath);

      // final task = _dm.getDownload(ticket.fileUrl);

      if (task == null) {
        throw TicketsException(
            "Can't download the file from ${ticket.fileUrl}");
      }

      if (onReceiveProgressCallback != null) {
        await task.whenDownloadComplete(timeout: const Duration(minutes: 5));
        task.progress.addListener(
          () async {
            ticket.setFilePath(saveFilePath);
            await updateTicket(ticket);
          },
        );

        onReceiveProgressCallback(task);
      } else {
        ticket.setFilePath(saveFilePath);
        await updateTicket(ticket);
      }

      // ticket.setFilePath(saveFilePath);

      return ticket;
    } on TicketsException catch (_) {
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }
}
