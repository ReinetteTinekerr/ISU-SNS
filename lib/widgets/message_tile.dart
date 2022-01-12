import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:university_chat_app/domain/models/chat_message.dart';
import 'package:university_chat_app/widgets/message_received_bubble.dart';
import 'package:university_chat_app/widgets/message_sent_bubble.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final alignment = message.messageType == 'receiver'
        ? Alignment.topLeft
        : Alignment.topRight;
    final color = message.messageType == 'receiver'
        ? const Color.fromRGBO(255, 249, 193, 1)
        : const Color.fromRGBO(207, 235, 210, 1);
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 7),
      child: PopupMenuButton(
        tooltip: 'actions',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        itemBuilder: (context) => <PopupMenuEntry>[
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.reply_outlined),
              title: Text('Reply'),
            ),
          ),
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.copy),
              title: Text('Copy'),
            ),
          ),
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(MdiIcons.pinOutline),
              title: Text('Pin'),
            ),
          ),
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(MdiIcons.commentEditOutline),
              title: Text('Edit'),
            ),
          ),
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
            ),
          ),
        ],
        // child: Container(
        //   constraints: const BoxConstraints(maxWidth: 350),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //     color: color,
        //   ),
        //   padding: const EdgeInsets.all(8),
        //   child: Text(
        //     message.messageContent,
        //     style: const TextStyle(fontSize: 15, color: Colors.black),
        //   ),
        // ),
        child: message.messageType == 'receiver'
            ? MessageReceivedBubble(message: message.messageContent)
            : MessageSentBubble(message: message.messageContent),
      ),
    );
  }
}
