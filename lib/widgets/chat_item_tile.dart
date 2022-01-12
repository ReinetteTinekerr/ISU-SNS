import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatItemTile extends ConsumerStatefulWidget {
  const ChatItemTile({
    Key? key,
    required this.index,
    required this.title,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isMessageRead,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final String title;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isMessageRead;
  final VoidCallback onTap;
  @override
  _ChatItemTileState createState() => _ChatItemTileState();
}

class _ChatItemTileState extends ConsumerState<ChatItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,

      leading: const CircleAvatar(),
      title: Text(widget.title),
      subtitle: Text(
        widget.messageText,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade600,
          fontWeight:
              widget.isMessageRead ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Text(widget.time),
      // tileColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }
}
