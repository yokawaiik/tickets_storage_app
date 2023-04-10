import 'package:flutter/material.dart';

import '../../domain/models/ticket.dart';

class ListTicketItemWidget extends StatefulWidget {
  final Ticket ticket;
  final String title;
  final String subtitle;

  void Function()? onPressedDownload;
  void Function(DismissDirection)? onDismissed;

  ListTicketItemWidget({
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

    return Dismissible(
      key: widget.key!,
      background: Container(color: Colors.red),
      onDismissed: widget.onDismissed,
      child: ListTile(
        leading: Icon(Icons.airplane_ticket),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: colorScheme.primary),
            ),
            // LinearProgressIndicator(),
            LinearProgressIndicator(
              value: 0,
            )
          ],
        ),
        subtitle: Text(widget.subtitle),
        trailing: IconButton(
          onPressed: widget.onPressedDownload,
          color: colorScheme.primary,
          icon: Icon(
            Icons.cloud_download,
          ),
        ),
      ),
    );
  }
}
