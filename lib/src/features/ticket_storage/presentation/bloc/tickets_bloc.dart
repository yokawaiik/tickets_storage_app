import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:documents_saver_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:documents_saver_app/src/features/ticket_storage/domain/enums/ticket_exception_code.dart';
import 'package:documents_saver_app/src/features/ticket_storage/domain/models/tickets_exception.dart';
import 'package:documents_saver_app/src/i18n/translations.g.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:meta/meta.dart';

import '../../domain/enums/error_situation.dart';
import '../../domain/models/ticket.dart';
import '../../domain/repositories/tickets_repository.dart';

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

  late final SettingsBloc _settingsBloc;
  TranslationsEn get _t => _settingsBloc.state.t;

  TicketsBloc({
    required SettingsBloc settingsBloc,
  }) : super(InitialTicketsState()) {
    _ticketsRepository = TicketsRepository(settingsBloc);
    _totalCountTickets = 0;
    _offset = 0;

    _settingsBloc = settingsBloc;

    on<GetTicketsEvent>((event, emit) async {
      try {
        debugPrint(
            "GetTicketsEvent - constants.listPageLimit: ${constants.listPageLimit} - _offset : $_offset");

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
        emit(ErrorTicketsState(_t.errorStrings.features.ticketStorage
            .presentation.ticketsBloc.getTicketsEvent.error));
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
      } on TicketsException catch (e) {
        debugPrint("GetSingleTicketsEvent - TicketsException - e: $e");

        if (e.ticketExceptionCode == TicketExceptionCode.ticketWasNotFound) {
          emit(ErrorTicketsState(
              _t.errorStrings.features.ticketStorage.presentation.ticketsBloc
                  .getSingleTicketsEvent.notFound,
              ErrorSituation.ticket));
        } else {
          emit(ErrorTicketsState(
              _t.errorStrings.unexpected, ErrorSituation.ticket));
        }
      } catch (e) {
        debugPrint("GetSingleTicketsEvent - e: $e");
        emit(ErrorTicketsState(
            _t.errorStrings.features.ticketStorage.presentation.ticketsBloc
                .getSingleTicketsEvent.error,
            ErrorSituation.ticket));
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
        debugPrint(
            "AddTicketEvent - TicketsException - e: $e, ticketExceptionCode: ${e.ticketExceptionCode}");

        emit(ErrorTicketsState(e));
      } catch (e) {
        debugPrint("AddTicketEvent - e: $e");
        emit(ErrorTicketsState(_t.errorStrings.features.ticketStorage
            .presentation.ticketsBloc.addTicketEvent.error));
      }
    });
    on<DeleteTicketEvent>((event, emit) async {
      try {
        final ticket = _tickets.firstWhere((ticket) => ticket.id == event.id);
        await _ticketsRepository.removeTicket(ticket);

        _tickets.removeWhere((ticket) => ticket.id == event.id);
        _totalCountTickets--;
        _offset--;

        if (_tickets.length <= constants.listPageLimit) {
          /// load as much as was deleted
          final loadedTickets = await _ticketsRepository.getTicketList(
            1,
            _offset,
          );

          _tickets.addAll(loadedTickets);
          _offset += loadedTickets.length;
        }

        emit(RemovedSingleTicketsState(ticket));
      } catch (e) {
        debugPrint("DeletedTicketEvent - e: $e");
        emit(ErrorTicketsState(_t.errorStrings.features.ticketStorage
            .presentation.ticketsBloc.deletedTicketEvent.error));
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

        emit(ErrorTicketsState(_t.errorStrings.features.ticketStorage
            .presentation.ticketsBloc.refreshTicketsEvent.error));
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
        emit(ErrorTicketsState(_t.errorStrings.features.ticketStorage
            .presentation.ticketsBloc.setSelectionSingleTicketsEvent.error));
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
        emit(ErrorTicketsState(_t.errorStrings.features.ticketStorage
            .presentation.ticketsBloc.resetSelectionTicketsEvent.error));
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
        _offset -= deleteSelectedTickets.length;
        _totalCountTickets -= deleteSelectedTickets.length;

        if (_tickets.length <= constants.listPageLimit) {
          /// load as much as was deleted
          final loadedTickets = await _ticketsRepository.getTicketList(
            deleteSelectedTickets.length,
            _offset,
          );

          _tickets.addAll(loadedTickets);
          _offset += loadedTickets.length;
        }

        debugPrint("deleteSelectedTickets: $deleteSelectedTickets");

        emit(RemovedSelectedTicketsState(deleteSelectedTickets));
      } catch (e) {
        debugPrint("DeleteSelectedTicketsEvent - e: $e");
        emit(ErrorTicketsState(_t.errorStrings.features.ticketStorage
            .presentation.ticketsBloc.removeSelectedTicketsEvent.error));
      }
    });
  }
}
