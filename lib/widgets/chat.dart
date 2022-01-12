import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:university_chat_app/domain/models/chat_message.dart';
import 'package:university_chat_app/widgets/message_stats.dart';
import 'package:university_chat_app/widgets/message_tile.dart';

class Chat extends StatefulWidget {
  const Chat({
    Key? key,
    required this.messages,
    required this.scrollController,
    this.textFieldOnFocus,
  }) : super(key: key);

  final List<ChatMessage> messages;
  final ScrollController scrollController;
  final VoidCallback? textFieldOnFocus;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void addNewMessage(String messageContent) {
    if (messageContent.isEmpty) return;
    ChatMessage message = ChatMessage(
      messageContent: messageContent,
      messageType: 'sender',
    );
    setState(() {
      widget.messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: widget.messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                final message = widget.messages[index];
                return SwipeTo(
                  child: MessageTile(message: message),
                  onLeftSwipe: () {},
                  onRightSwipe: () {},
                );
                // return MessageTile(message: message);
              },
            ),
          ),
        ),
        MessageStats(
          addNewMessage: addNewMessage,
          textFieldOnFocus: widget.textFieldOnFocus,
          onTap: () {
            Timer(
              const Duration(milliseconds: 200),
              () => widget.scrollController.jumpTo(
                widget.scrollController.position.maxScrollExtent,
              ),
            );
          },
        ),
      ],
    );
  }
}
