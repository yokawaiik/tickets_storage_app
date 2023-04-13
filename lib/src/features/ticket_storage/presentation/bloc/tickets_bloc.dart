import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:documents_saver_app/src/features/ticket_storage/domain/models/tickets_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:meta/meta.dart';

import '../../domain/enums/error_situation.dart';
import '../../domain/models/ticket.dart';
import '../../domain/repository/tickets_repository.dart';

import '../../data/constants/constants.dart' as constants;

part 'tickets_event.dart';
part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  late int _totalCountTickets;
  int get totalCountTickets => _totalCountTickets;

  late int _offset;

  final List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  late final TicketsRepository _ticketsRepository;

  TicketsBloc() : super(InitialTicketsState()) {
    _ticketsRepository = TicketsRepository();
    _totalCountTickets = 0;
    _offset = 0;

    on<GetTicketsEvent>((event, emit) async {
      try {
        debugPrint(
            "GetTicketsEvent - constants.listPageLimit: ${constants.listPageLimit} - _offset : ${_offset}");

        if (event.inital == true) {
          _totalCountTickets = await _ticketsRepository.getTotalCountTickets();
          _offset = 0;
        }

        final loadedTickets = await _ticketsRepository.getTicketList(
          constants.listPageLimit,
          _offset,
        );

        _tickets.addAll(loadedTickets);

        _offset += loadedTickets.length;

        emit(LoadedTicketsState(loadedTickets));
      } catch (e) {
        debugPrint("GetInitialTicketsEvent - e: $e");
        emit(ErrorTicketsState("Tickets hasn't got from local storage."));
      }
    });

    /// GetSingleTicketsEvent - when user tap on a item list
    on<GetSingleTicketsEvent>((event, emit) async {
      try {
        debugPrint("GetSingleTicketsEvent - event: ${event.id}");

        final loadedTickets = await _ticketsRepository.getSingleTicket(
          event.id,
        );

        emit(LoadedSingleTicketState(loadedTickets));
      } catch (e) {
        debugPrint("GetSingleTicketsEvent - e: $e");
        emit(ErrorTicketsState("Tickets hasn't got from local storage."));
      }
    });

    on<AddTicketEvent>((event, emit) async {
      try {
        final addedTicket = await _ticketsRepository.addTicket(event.fileUrl);

        _tickets.insert(0, addedTicket!);

        _totalCountTickets++;
        _offset++;

        emit(AddedSingleTicketsState(addedTicket));
      } on TicketsException catch (e) {
        debugPrint("AddTicketEvent - TicketsException - e: $e");
        emit(ErrorTicketsState(e.message));
      } catch (e) {
        debugPrint("AddTicketEvent - e: $e");
        emit(ErrorTicketsState("Ticket wasn't added."));
      }
    });
    on<DeletedTicketEvent>((event, emit) async {
      try {
        final ticket = _tickets.firstWhere((ticket) => ticket.id == event.id);
        await _ticketsRepository.removeTicket(ticket);

        _tickets.removeWhere((ticket) => ticket.id == event.id);
        _totalCountTickets--;
        _offset--;

        emit(RemovedSingleTicketsState(ticket));
      } catch (e) {
        debugPrint("DeletedTicketEvent - e: $e");
        emit(ErrorTicketsState("Ticket wasn't deleted."));
      }
    });
    on<RefreshTicketsEvent>((event, emit) async {
      try {
        _tickets.clear();
        _totalCountTickets = await _ticketsRepository.getTotalCountTickets();
        _offset = 0;

        final loadedTickets = await _ticketsRepository.getTicketList(
          constants.listPageLimit,
          _offset,
        );

        _tickets.addAll(loadedTickets);
        _offset += loadedTickets.length;

        emit(LoadedTicketsState(tickets));
      } catch (e) {
        debugPrint("RefreshTicketsEvent - e: $e");
        emit(ErrorTicketsState("Can't loaded tickets."));
      } finally {
        event.completer?.complete();
      }
    });
    on<SetSelectionSingleTicketsEvent>((event, emit) {
      try {
        final foundTicket =
            _tickets.firstWhere((ticket) => ticket == event.ticket);

        foundTicket.setSelection(event.selection);

        emit(SetSelectionSingleTicketsState(foundTicket));
      } catch (e) {
        debugPrint("SelectTicketEvent - e: $e");
        emit(ErrorTicketsState("Can't select a ticket."));
      }
    });
    on<ResetSelectionTicketsEvent>((event, emit) {
      debugPrint("ResetSelectionTicketsEvent");

      try {
        final List<Ticket> resetSelectionTickets = [];
        for (var ticket in _tickets) {
          if (ticket.isSelected) {
            ticket.setSelection(false);
            resetSelectionTickets.add(ticket);
          }
        }

        emit(ResetSelectionTicketsState(resetSelectionTickets));
      } catch (e) {
        debugPrint("ResetSelectionTicketsEvent - e: $e");
        emit(ErrorTicketsState("Can't reset selection."));
      }
    });
    on<RemoveSelectedTicketsEvent>((event, emit) async {
      debugPrint("DeleteSelectedTicketsEvent");

      try {
        final List<Ticket> deleteSelectedTickets = [];
        for (var ticket in _tickets) {
          if (ticket.isSelected) {
            ticket.setSelection(false);
            deleteSelectedTickets.add(ticket);
          }
        }

        await _ticketsRepository.removeGroupTickets(deleteSelectedTickets);

        _tickets
            .removeWhere((ticket) => deleteSelectedTickets.contains(ticket));

        debugPrint("deleteSelectedTickets: ${deleteSelectedTickets}");

        emit(RemovedSelectedTicketsState(deleteSelectedTickets));
      } catch (e) {
        debugPrint("DeleteSelectedTicketsEvent - e: $e");
        emit(ErrorTicketsState("Can't reset selection."));
      }
    });
  }
}
