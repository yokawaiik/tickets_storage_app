
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
  late final DownloadManager _dm;

  TicketsRepository() {
    _ticketStorage = TicketStorageHelper.instance;
    _dm = DownloadManager();
  }

  Future<int> getTotalCountTickets() async {
    try {
      final count = await _ticketStorage.getTotalCountTickets();
      return count;
    } catch (e) {
      debugPrint(
          "TicketsRepository - getTotalCountTickets - e: ${e.toString()}");
      throw Exception("Something went wrong.");
    }
  }

  Future<List<Ticket>> getTicketList(int limit, int offset) async {
    try {
      final tickets = await _ticketStorage.getTicketList(limit, offset);

      return tickets;
    } catch (e) {
      debugPrint("TicketsRepository - getTicketList - e: ${e.toString()}");
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
    } on TicketsException catch (e) {
      debugPrint("TicketsRepository - addTicket - TicketsException - e: $e");
      rethrow;
    } catch (e) {
      debugPrint("TicketsRepository - addTicket - e: ${e.toString()}");
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
      debugPrint("TicketsRepository - updateTicket - e: ${e.toString()}");
      throw Exception("Something went wrong.");
    }
  }

  Future<void> removeTicket(Ticket ticket) async {
    try {
      await _ticketStorage.removeTicket(ticket.id);
      if (ticket.filePath != null) {
        await File(ticket.filePath!).delete();
      }
    } on PathNotFoundException catch (e) {
      // file doesn't exist
      if (e.osError?.errorCode == 2) {
        return;
      }
      debugPrint(
          "TicketsRepository - removeTicket - PathNotFoundException - e: ${e.toString()}");
    } catch (e) {
      debugPrint("TicketsRepository - removeTicket - e: ${e.toString()}");
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
      debugPrint("TicketsRepository - removeGroupTickets - e: ${e.toString()}");
      throw Exception("Something went wrong.");
    }
  }

  Future<Ticket> getSingleTicket(String id) async {
    try {
      final ticket = await _ticketStorage.getTicketById(id);

      if (ticket == null) {
        throw TicketsException("Ticket wasnt't updated.");
      }

      return ticket;
    } on TicketsException catch (e) {
      debugPrint(
          "TicketsRepository - removeGroupTickets - TicketsException - e: ${e.toString()}");
      rethrow;
    } catch (e) {
      debugPrint("TicketsRepository - removeGroupTickets - e: ${e.toString()}");
      throw Exception("Something went wrong.");
    }
  }
}
