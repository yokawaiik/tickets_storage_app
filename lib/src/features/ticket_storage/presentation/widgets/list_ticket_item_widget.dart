import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../../i18n/translations.g.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../../domain/repositories/file_manager_repository.dart';

import '../../../../theme/theme.dart';
import '../../domain/models/ticket.dart';

import '../../../../router/router.dart' as router;

enum _FileStatus {
  pending,
  downloading,
  downloaded,
  error,
}

class ListTicketItemWidget extends StatefulWidget {
  final Ticket ticket;
  final String title;
  final String subtitleFileDownload;
  final String subtitleFileDownloading;
  final String subtitleFileDownloaded;
  final String subtitleFileError;

  final void Function() onDismissed;
  final void Function(bool) onSelectCallback;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  final bool isSelectionMode;

  const ListTicketItemWidget({
    required super.key,
    required this.title,
    required this.ticket,
    required this.subtitleFileDownload,
    required this.subtitleFileDownloading,
    required this.subtitleFileDownloaded,
    required this.subtitleFileError,
    required this.onDismissed,
    required this.scaffoldMessengerKey,
    this.isSelectionMode = false,
    required this.onSelectCallback,
  });

  @override
  State<ListTicketItemWidget> createState() => _ListTicketItemWidgetState();
}

class _ListTicketItemWidgetState extends State<ListTicketItemWidget> {
  late _FileStatus _fileStatus;
  late final FileManagerRepository _fileManagerRepository;
  DownloadTask? _downloadTask;

  TranslationsEn get _t => context.read<SettingsBloc>().state.t;

  @override
  void initState() {
    _fileManagerRepository = FileManagerRepository();

    if (widget.ticket.filePath != null) {
      _fileStatus = _FileStatus.downloaded;
    } else {
      _fileStatus = _FileStatus.pending;
    }

    if (!widget.isSelectionMode) {
      widget.ticket.setSelection(false);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: _openFile,
      child: Slidable(
        enabled: widget.isSelectionMode == false,
        key: ValueKey(widget.key!.toString()),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              spacing: 4,
              onPressed: (_) => widget.onDismissed(),
              backgroundColor: ColorConstants.deleteColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: _t.strings.storagePage.body.listTicketItem.slidableAction
                  .delete,
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.local_activity),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${widget.title} ",
                      style: TextStyle(color: colorScheme.primary),
                    ),
                    TextSpan(
                      text: widget.ticket.id,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: _linearProgressBuilder(),
              ),
            ],
          ),
          subtitle: _buildSubtitle(),
          trailing: widget.isSelectionMode == true
              ? Checkbox(
                  value: widget.ticket.isSelected,
                  onChanged: _select,
                )
              : _buildDownloadButton(context),
        ),
      ),
    );
  }

  Text _buildSubtitle() {
    final colorScheme = Theme.of(context).colorScheme;

    late final String text;
    late final Color color;

    switch (_fileStatus) {
      case _FileStatus.pending:
        text = widget.subtitleFileDownload;
        color = colorScheme.primary;
        break;
      case _FileStatus.downloading:
        text = widget.subtitleFileDownloading;
        color = colorScheme.primary;
        break;
      case _FileStatus.downloaded:
        text = widget.subtitleFileDownloaded;
        color = colorScheme.secondary;
        break;
      case _FileStatus.error:
        text = widget.subtitleFileError;
        color = colorScheme.error;
        break;
    }

    return Text(
      text,
      style: TextStyle(color: color),
    );
  }

  Widget? _buildDownloadButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    late final Color color;
    late final IconData icon;
    late final void Function()? onPressed;

    switch (_fileStatus) {
      case _FileStatus.pending:
        color = colorScheme.primary;
        icon = Icons.cloud_download;
        onPressed = _downloadFile;
        break;
      case _FileStatus.downloading:
        color = colorScheme.tertiary;
        icon = Icons.cloud_sync_sharp;
        onPressed = null;
        break;
      case _FileStatus.downloaded:
        color = colorScheme.secondary;
        icon = Icons.cloud_done_outlined;
        onPressed = null;
        break;
      case _FileStatus.error:
        color = colorScheme.error;
        icon = Icons.repeat;
        onPressed = _downloadFile;
        break;
    }

    return IconButton(
      onPressed: onPressed,
      color: color,
      icon: Icon(
        icon,
      ),
    );
  }

  Widget _linearProgressBuilder() {
    final colorScheme = Theme.of(context).colorScheme;

    switch (_fileStatus) {
      case _FileStatus.pending:
        return const LinearProgressIndicator(
          value: 0.0,
        );
      case _FileStatus.downloading:
        return ValueListenableBuilder(
          valueListenable: _downloadTask!.progress,
          builder: (_, value, widget) {
            return LinearProgressIndicator(
              value: value,
            );
          },
        );
      case _FileStatus.downloaded:
        return LinearProgressIndicator(
          value: 1.0,
          color: colorScheme.secondary,
        );
      case _FileStatus.error:
        return LinearProgressIndicator(
          value: 0.0,
          backgroundColor: colorScheme.error,
        );
    }
  }

  void _downloadFile() async {
    try {
      _downloadTask = await _fileManagerRepository.downloadTicketFile(
        widget.ticket,
      );

      _downloadTask?.whenDownloadComplete(
        timeout: const Duration(seconds: 30),
      );

      if (_downloadTask != null) {
        _fileStatus = _FileStatus.downloading;
        setState(() {});
      }

      _downloadTask?.status.addListener(() async {
        if (!_downloadTask!.status.value.isCompleted) return;

        widget.ticket.setFilePath(_downloadTask!.request.path);

        debugPrint("File was saved by path: ${_downloadTask!.request.path}");
        print("File was saved by path: ${_downloadTask!.request.path}");

        await _fileManagerRepository.updateTicket(
          widget.ticket,
        );

        _fileStatus = _FileStatus.downloaded;
        setState(() {});
      });
    } catch (e) {
      _fileStatus = _FileStatus.error;
      setState(() {});
    }
  }

  void _openFile() async {
    late final String? message;

    print("File path: ${widget.ticket.filePath}");

    if (widget.ticket.filePath == null) {
      message = _t.strings.storagePage.snakbarMessages.requiredSaveFile;
    } else {
      final isFileExists = File(widget.ticket.filePath!).existsSync();
      // doesnNotExist
      if (!isFileExists) {
        message = _t.strings.storagePage.body.listTicketItem.file.doesnNotExist;
        widget.ticket.setFilePath(null);
        _fileStatus = _FileStatus.pending;
        setState(() {});
        await _fileManagerRepository.updateTicket(
          widget.ticket,
        );
      } else {
        message = null;
      }
    }

    if (message != null) {
      ScaffoldMessenger.of(widget.scaffoldMessengerKey.currentContext!)
          .showSnackBar(
        SnackBar(content: Text(message)),
      );
      return;
    }

    await context.pushNamed(
      router.ticketDetailPage,
      queryParams: router.TicketDetailPageQueryParams(id: widget.ticket.id)
          .toParamsMap(),
    );
  }

  void _select(bool? value) {
    if (value == null) return;

    widget.ticket.setSelection(value);

    widget.onSelectCallback(widget.ticket.isSelected);
    setState(() {});
  }
}
