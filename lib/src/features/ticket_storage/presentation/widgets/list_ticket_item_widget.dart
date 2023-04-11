import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../theme/theme.dart';
import '../../domain/models/ticket.dart';

class ListTicketItemWidget extends StatefulWidget {
  final Ticket ticket;
  final String title;
  final String subtitle;

  final void Function()? onPressedDownload;
  final void Function() onDismissed;

  const ListTicketItemWidget({
    required super.key,
    required this.title,
    required this.ticket,
    required this.subtitle,
    required this.onPressedDownload,
    required this.onDismissed,
  });

  @override
  State<ListTicketItemWidget> createState() => _ListTicketItemWidgetState();
}

class _ListTicketItemWidgetState extends State<ListTicketItemWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Slidable(
      key: ValueKey(widget.key!.toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => widget.onDismissed(), // todo: onPressed
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
            StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return LinearProgressIndicator(
                  value: 0.0,
                );
              },
            )
          ],
        ),
        subtitle: Text(widget.subtitle),
        trailing: widget.onPressedDownload != null
            ? IconButton(
                onPressed: widget.onPressedDownload,
                color: colorScheme.primary,
                icon: Icon(
                  widget.ticket.filePath != null
                      ? Icons.cloud_done_outlined
                      : Icons.cloud_download,
                ),
              )
            : null,
      ),
    );
  }
}
