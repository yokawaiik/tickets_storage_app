import 'dart:core';
import 'dart:io';

import 'package:documents_saver_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:documents_saver_app/src/features/ticket_storage/domain/models/tickets_exception.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

import '../../../../i18n/translations.g.dart';
import '../../data/database/tickets_storage_helper.dart';
import '../enums/ticket_exception_code.dart';
import '../models/ticket.dart';

class TicketsRepository {
  late final TicketStorageHelper _ticketStorage;
  late final SettingsBloc _settingsBloc;

  TranslationsEn get _t => _settingsBloc.state.t;

  TicketsRepository(SettingsBloc settingsBloc) {
    _ticketStorage = TicketStorageHelper.instance;
    _settingsBloc = settingsBloc;
  }

  Future<int> getTotalCountTickets() async {
    try {
      final count = await _ticketStorage.getTotalCountTickets();
      return count;
    } catch (e) {
      debugPrint(
          "TicketsRepository - getTotalCountTickets - e: ${e.toString()}");
      throw Exception(_t.errorStrings.unexpected);
    }
  }

  Future<List<Ticket>> getTicketList(int limit, int offset) async {
    try {
      final tickets = await _ticketStorage.getTicketList(limit, offset);

      return tickets;
    } catch (e) {
      debugPrint("TicketsRepository - getTicketList - e: ${e.toString()}");
      throw Exception(_t.errorStrings.unexpected);
    }
  }

  Future<Ticket?> addTicket(String fileUrl) async {
    try {
      await _ticketStorage.addTicket(fileUrl, nanoid().toUpperCase());

      final addedTicket = await _ticketStorage.getTicket(fileUrl);

      if (addedTicket == null) {
        throw TicketsException(
          _t.errorStrings.features.ticketStorage.repositories.ticketsRepository
              .addTicket.notAdded,
          TicketExceptionCode.duplicate,
        );
      }

      return addedTicket;
    } on TicketsException catch (e) {
      debugPrint("TicketsRepository - addTicket - TicketsException - e: $e");

      late final TicketExceptionCode ticketExceptionCode;
      late final String message;
      switch (e.ticketExceptionCode) {
        case TicketExceptionCode.duplicate:
          message = _t.errorStrings.features.ticketStorage.repositories
              .ticketsRepository.addTicket.duplicate;
          ticketExceptionCode = TicketExceptionCode.duplicate;
          break;
        default:
          message = _t.errorStrings.unexpected;
          ticketExceptionCode = TicketExceptionCode.any;
          break;
      }

      throw TicketsException(
        message,
        ticketExceptionCode,
      );
    } catch (e) {
      debugPrint("TicketsRepository - addTicket - e: ${e.toString()}");
      throw Exception(_t.errorStrings.unexpected);
    }
  }

  Future<Ticket?> updateTicket(Ticket ticket) async {
    try {
      await _ticketStorage.updateTicket(ticket);

      final addedTicket = await _ticketStorage.getTicket(ticket.fileUrl);

      if (addedTicket == null) {
        throw Exception(_t.errorStrings.features.ticketStorage.repositories
            .ticketsRepository.updateTicket.notUpdated);
      }

      return addedTicket;
    } catch (e) {
      debugPrint("TicketsRepository - updateTicket - e: ${e.toString()}");
      throw Exception(_t.errorStrings.unexpected);
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
      throw Exception(_t.errorStrings.unexpected);
    }
  }

  Future<void> removeGroupTickets(List<Ticket> tickets) async {
    try {
      await _ticketStorage
          .removeGroupTickets(tickets.map((t) => t.id).toList());

      for (final ticket in tickets) {
        if (ticket.filePath != null) {
          try {
            await File(ticket.filePath!).delete();
          } on PathNotFoundException catch (e) {
            if (e.osError?.errorCode == 2) {
              continue;
            }
          }
        }
      }
    } catch (e) {
      debugPrint("TicketsRepository - removeGroupTickets - e: ${e.toString()}");
      throw Exception(_t.errorStrings.unexpected);
    }
  }

  Future<Ticket> getSingleTicket(String id) async {
    try {
      final ticket = await _ticketStorage.getTicketById(id);

      if (ticket == null) {
        throw TicketsException(_t.errorStrings.features.ticketStorage
            .repositories.ticketsRepository.getSingleTicket.itsNull);
      }

      return ticket;
    } on TicketsException catch (e) {
      debugPrint(
          "TicketsRepository - removeGroupTickets - TicketsException - e: ${e.toString()}");

      rethrow;
    } catch (e) {
      debugPrint("TicketsRepository - removeGroupTickets - e: ${e.toString()}");
      throw Exception(_t.errorStrings.unexpected);
    }
  }
}
