import 'dart:io';

import 'package:dio/dio.dart';
import 'package:documents_saver_app/src/features/ticket_storage/domain/models/tickets_exception.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:nanoid/nanoid.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/database/tickets_storage_helper.dart';
import '../models/ticket.dart';

class TicketsRepository {
  late final TicketStorageHelper _ticketStorage;
  late final Dio _dio;

  TicketsRepository() {
    _ticketStorage = TicketStorageHelper.instance;
    _dio = Dio();
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

  Future<void> removeTicket(String id) async {
    try {
      await _ticketStorage.removeTicket(id);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  Future<void> removeGroupTickets(List<String> idList) async {
    try {
      await _ticketStorage.removeGroupTickets(idList);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }

  // Future<List<Ticket>> removeTickets(List<Ticket> tickets) async {}

  Future<Ticket> downloadTicketFile(Ticket ticket) async {
    try {
      final Directory appDocumentsDir = await getTemporaryDirectory();

      final rs = await _dio.download(
        ticket.fileUrl,
        appDocumentsDir.path,
      );

      // todo: Add here path to file
      // ticket.setFilePath(appDocumentsDir.path + rs.headers.);

      return ticket;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Something went wrong.");
    }
  }
}
