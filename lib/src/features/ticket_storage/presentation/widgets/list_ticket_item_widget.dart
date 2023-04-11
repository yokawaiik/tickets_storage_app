import 'package:documents_saver_app/src/features/ticket_storage/domain/repository/file_manager_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../theme/theme.dart';
import '../../domain/models/ticket.dart';

class ListTicketItemWidget extends StatefulWidget {
  final Ticket ticket;
  final String title;
  final String subtitleFileDownload;
  final String subtitleFileDownloaded;

  // final DownloadTask Function()? onPressedDownload;
  final void Function() onDismissed;

  const ListTicketItemWidget({
    required super.key,
    required this.title,
    required this.ticket,
    required this.subtitleFileDownload,
    required this.subtitleFileDownloaded,
    // required this.onPressedDownload,
    required this.onDismissed,
  });

  @override
  State<ListTicketItemWidget> createState() => _ListTicketItemWidgetState();
}

class _ListTicketItemWidgetState extends State<ListTicketItemWidget> {
  // late final ValueNotifier<double> _downloadProgress;

  // bool get _isFileDownloaded => _downloadProgress.value == 1.0 ? true : false;

  // @override
  // void initState() {
  //   _downloadProgress = ValueNotifier(widget.ticket.filePath == null ? 0 : 1.0);

  //   super.initState();
  // }

  late bool _hasError;

  late final FileManagerRepository _fileManagerRepository;
  DownloadTask? _downloadTask;

  bool get _isFileDownloaded {
    if (widget.ticket.filePath != null) {
      return true;
    }

    if (_downloadTask == null) return false;

    return _downloadTask!.status.value.isCompleted;
  }

  @override
  void initState() {
    _fileManagerRepository = FileManagerRepository();
    _hasError = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Slidable(
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
            Text(
              widget.title,
              style: TextStyle(color: colorScheme.primary),
            ),
            // ValueListenableBuilder(
            //   valueListenable: _downloadProgress,
            //   builder: (_, value, widget) {
            //     return LinearProgressIndicator(
            //       value: value,
            //     );
            //   },
            // )
            _downloadTask == null
                ? LinearProgressIndicator(
                    value: _isFileDownloaded ? 1.0 : 0.0,
                  )
                : ValueListenableBuilder(
                    valueListenable: _downloadTask!.progress,
                    builder: (_, value, widget) {
                      return LinearProgressIndicator(
                        value: value,
                      );
                    },
                  )
          ],
        ),
        subtitle: Text(
          _isFileDownloaded
              ? widget.subtitleFileDownloaded
              : widget.subtitleFileDownload,
        ),
        // trailing: widget.onPressedDownload != null
        //     ? IconButton(
        //         // onPressed: widget.onPressedDownload,
        //         onPressed: _downloadFile,
        //         color: colorScheme.primary,
        //         icon: Icon(
        //           widget.ticket.filePath != null
        //               ? Icons.cloud_done_outlined
        //               : Icons.cloud_download,
        //         ),
        //       )
        //     : null,
        trailing: _buildDownloadButton(context),
      ),
    );
  }

  Widget? _buildDownloadButton(BuildContext context) {
    // if (widget.onPressedDownload != null) return null;

    final colorScheme = Theme.of(context).colorScheme;

    late final Color color;
    late final IconData icon;
    late final void Function()? onPressed;
    if (_isFileDownloaded) {
      color = colorScheme.secondary;
      icon = Icons.cloud_download;
      onPressed = null;
    } else if (_hasError) {
      color = colorScheme.error;
      icon = Icons.cloud_off;
      onPressed = null;
    } else {
      color = colorScheme.primary;
      icon = Icons.cloud_done_outlined;
      onPressed = _downloadFile;
    }

    return IconButton(
      onPressed: onPressed,
      color: color,
      icon: Icon(
        icon,
      ),
    );
  }

  void _downloadFile() async {
    // if it shows then user can press
    // widget.onPressedDownload!();

    // _downloadProgress.value = 0.50;
    setState(() {});
    _downloadTask = await _fileManagerRepository.downloadTicketFile(
      widget.ticket,
      _completeCallback,
      _errorCallback,
    );

    setState(() {});
  }

  _completeCallback() {
    setState(() {});
  }

  _errorCallback() {
    _hasError = true;
    setState(() {});
  }
}
