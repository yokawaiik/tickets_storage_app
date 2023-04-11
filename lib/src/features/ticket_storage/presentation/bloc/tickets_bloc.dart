import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:documents_saver_app/src/features/ticket_storage/domain/models/tickets_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:meta/meta.dart';

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

    on<AddTicketEvent>((event, emit) async {
      try {
        final addedTicket = await _ticketsRepository.addTicket(event.fileUrl);

        _tickets.add(addedTicket!);
        _totalCountTickets++;
        _offset++;

        emit(AddedSingleTicketsState(addedTicket));
      } on IsarError catch (e) {
        debugPrint("AddTicketEvent - IsarError - e: $e");
        late final String msg;
        if (e.message
            .toLowerCase()
            .contains("Unique index violated.".toLowerCase())) {
          msg = "Such link has already been saved.";
        } else {
          msg = 'Something went wrong';
        }

        emit(ErrorTicketsState(msg));
      } on TicketsException catch (e) {
        emit(ErrorTicketsState(e.message));
      } catch (e) {
        debugPrint("AddTicketEvent - e: $e");
        emit(ErrorTicketsState("Ticket wasn't added."));
      }
    });
    on<DeletedTicketEvent>((event, emit) async {
      try {
        await _ticketsRepository.removeTicket(event.id);

        final ticket = _tickets.firstWhere((ticket) => ticket.id == event.id);

        _tickets.removeWhere((ticket) => ticket.id == event.id);
        _totalCountTickets--;
        _offset--;

        emit(RemovedSingleTicketsState(ticket));
      } catch (e) {
        debugPrint("DeletedTicketEvent - e: $e");
        emit(ErrorTicketsState("Ticket wasn't deleted."));
      }
    });
    on<DeletedGroupTicketsEvent>((event, emit) async {
      try {
        await _ticketsRepository
            .removeGroupTickets(event.tickets.map((t) => t.id).toList());

        _tickets.removeWhere((ticket) => event.tickets.contains(ticket));
        _totalCountTickets -= event.tickets.length;
        _offset -= event.tickets.length;

        emit(RemovedGroupTicketsState(event.tickets));
      } catch (e) {
        debugPrint("DeletedGroupTicketsEvent - e: $e");
        emit(ErrorTicketsState("Group of tickets wasn't deleted."));
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
    on<DownloadSingleTicketEvent>((event, emit) async {
      try {
        // todo: download
        final ticketWithFilePath =
            await _ticketsRepository.downloadTicketFile(event.ticket);

        await _ticketsRepository.updateTicket(ticketWithFilePath);

        _tickets
            .firstWhere((element) => element.id == ticketWithFilePath.id)
            .filePath = ticketWithFilePath.filePath;

        emit(DownloadSingleTicketsState(ticketWithFilePath));
      } catch (e) {
        debugPrint("DownloadSingleTicketEvent - e: $e");
        emit(ErrorTicketsState("Can't download a ticket."));
      }
    });
  }
}