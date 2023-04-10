import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../domain/models/ticket.dart';
import './database_constants.dart' as database_constants;
import 'collections/ticket_collection.dart';

const String suggestionsDatabase = "SuggestionsDatabase";

class TicketStorageHelper {
  // Make a singleton class
  TicketStorageHelper._privateConstructor();

  static final TicketStorageHelper instance =
      TicketStorageHelper._privateConstructor();

  // Use a single reference to the db.
  static Isar? _isar;
  // Use this getter to use the database.
  Future<Isar> get _database async {
    if (_isar != null) return _isar!;
    // Instantiate db the first time it is accessed
    _isar = await _initDB();
    return _isar!;
  }

  // Init the database for the first time.
  Future<Isar> _initDB() async {
    final isar = await Isar.open(
      [
        TicketCollectionSchema,
      ],
      name: database_constants.suggestionsDatabase,
    );
    return isar;
  }

  Future<List<Ticket>> getTicketList(int limit, int offset) async {
    final isar = await _database;

    final gotTicketCollection = await isar.ticketCollections
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();

    final ticketList = gotTicketCollection
        .map((ticket) => Ticket(
              id: ticket.id,
              fileUrl: ticket.fileUrl,
              filePath: ticket.filePath,
            ))
        .toList();

    return ticketList;
  }

  Future<void> addTicket(String fileUrl, String id) async {
    final isar = await _database;

    await isar.writeTxn(() async {
      await isar.ticketCollections.put(
        TicketCollection(
          fileUrl: fileUrl,
          id: id,
        ),
      );
    });
  }

  Future<Ticket?> getTicket(String fileUrl) async {
    final isar = await _database;

    final gotTicketCollection =
        await isar.ticketCollections.getByFileUrl(fileUrl);

    if (gotTicketCollection == null) {
      return null;
    }

    final ticket = Ticket(
      id: gotTicketCollection.id,
      fileUrl: gotTicketCollection.fileUrl,
      filePath: gotTicketCollection.filePath,
    );

    return ticket;
  }

  Future<void> removeTicket(String id) async {
    try {
      final isar = await _database;

      await isar.writeTxn(() async {
        await isar.ticketCollections.deleteById(id);
      });
    } catch (e) {
      debugPrint("removeTicket: ${e}");
      rethrow;
    }
  }

  Future<void> removeGroupTickets(List<String> idList) async {
    final isar = await _database;

    await isar.writeTxn(() async {
      await isar.ticketCollections.deleteAllById(
        idList,
      );
    });
  }

  Future<void> updateTicket(Ticket ticket) async {
    final isar = await _database;

    await isar.writeTxn(() async {
      await isar.ticketCollections.put(
        TicketCollection(
          id: ticket.id,
          fileUrl: ticket.fileUrl,
          filePath: ticket.filePath,
        ),
      );
    });
  }
}
