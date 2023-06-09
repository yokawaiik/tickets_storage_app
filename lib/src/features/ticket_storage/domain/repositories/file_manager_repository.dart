import 'dart:core';

import 'package:documents_saver_app/src/features/ticket_storage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:get_it/get_it.dart';

import '../../../../i18n/translations.g.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../../data/database/tickets_storage_helper.dart';
import '../models/ticket.dart';

class FileManagerRepository {
  late final TicketStorageHelper _ticketStorage;
  late final DownloadManager _dm;
  late final SettingsBloc _settingsBloc;

  TranslationsEn get _t => _settingsBloc.state.t;

  FileManagerRepository() {
    _ticketStorage = TicketStorageHelper.instance;
    _dm = DownloadManager();
    _settingsBloc = GetIt.I.get<SettingsBloc>();
  }

  Future<void> updateTicket(Ticket ticket) async {
    try {
      await _ticketStorage.updateTicket(ticket);
    } catch (e) {
      debugPrint(e.toString());
      // throw Exception("Something went wrong.");
      throw Exception(_t.errorStrings.unexpected);
    }
  }

  Future<DownloadTask?> downloadTicketFile(
    Ticket ticket,
  ) async {
    try {
      final pathToFile = await getPathToFile(ticket.fileUrl);
      final task = _dm.addDownload(ticket.fileUrl, pathToFile);

      return task;
    } catch (e) {
      debugPrint(
        "FileManagerRepository - downloadTicketFile - ${e.toString()}",
      );

      // throw Exception("Something went wrong.");
      throw Exception(_t.errorStrings.unexpected);
    }
  }

  Future<void> pauseDownloadTicketFile(
    Ticket ticket,
  ) async {
    try {
      await _dm.pauseDownload(ticket.fileUrl);
    } catch (e) {
      debugPrint(
        "FileManagerRepository - pauseDownloadTicketFile - ${e.toString()}",
      );

      // throw Exception("Something went wrong.");
      throw Exception(_t.errorStrings.unexpected);
    }
  }
}
