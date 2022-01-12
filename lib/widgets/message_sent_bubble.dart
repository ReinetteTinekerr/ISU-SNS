import 'package:flutter/material.dart';

class MessageSentBubble extends StatelessWidget {
  const MessageSentBubble({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 350),
      decoration: BoxDecoration(
        color: Colors.cyan[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(18),
          // bottomRight: Radius.circular(18),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );

    return messageTextGroup;
  }
}
