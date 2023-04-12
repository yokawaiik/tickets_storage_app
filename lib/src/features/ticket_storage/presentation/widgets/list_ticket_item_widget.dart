import 'package:documents_saver_app/src/features/ticket_storage/domain/repository/file_manager_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

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
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

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
  });

  @override
  State<ListTicketItemWidget> createState() => _ListTicketItemWidgetState();
}

class _ListTicketItemWidgetState extends State<ListTicketItemWidget> {
  late _FileStatus _fileStatus;
  late final FileManagerRepository _fileManagerRepository;
  DownloadTask? _downloadTask;

  @override
  void initState() {
    _fileManagerRepository = FileManagerRepository();
    if (widget.ticket.filePath != null) {
      _fileStatus = _FileStatus.downloaded;
    } else {
      _fileStatus = _FileStatus.pending;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: _openFile,
      child: Slidable(
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
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.airplane_ticket),
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
          trailing: _buildDownloadButton(context),
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

      widget.ticket.setFilePath(_downloadTask!.request.path);

      await _fileManagerRepository.updateTicket(
        widget.ticket,
      );

      _fileStatus = _FileStatus.downloaded;
    } catch (e) {
      _fileStatus = _FileStatus.error;
    } finally {
      setState(() {});
    }
  }

  void _openFile() {
    if (widget.ticket.filePath == null) {
      ScaffoldMessenger.of(widget.scaffoldMessengerKey.currentContext!)
          .showSnackBar(
        const SnackBar(content: Text("First, you need to save file.")),
      );
      return;
    }

    context.pushNamed(
      router.ticketDetailPage,
      queryParams: router.TicketDetailPageQueryParams(id: widget.ticket.id)
          .toParamsMap(),
    );
  }
}
