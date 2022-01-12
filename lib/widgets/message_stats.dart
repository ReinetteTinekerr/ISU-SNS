import 'package:flutter/material.dart';

class MessageStats extends StatefulWidget {
  const MessageStats({
    Key? key,
    required this.addNewMessage,
    required this.onTap,
    this.textFieldOnFocus,
  }) : super(key: key);

  final void Function(String) addNewMessage;
  final VoidCallback onTap;
  final VoidCallback? textFieldOnFocus;

  @override
  State<MessageStats> createState() => _MessageStatsState();
}

class _MessageStatsState extends State<MessageStats> {
  final _textController = TextEditingController();
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handleSubmitted() {
    setState(() => _isComposing = false);
    widget.addNewMessage(_textController.text.trim());
    _textController.clear();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 4, right: 4),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          ),
          Expanded(
            child: TextField(
              onTap: () {
                // TODO problem: need to tap again to collapse sliver app bar
                widget.textFieldOnFocus?.call();
              },
              // expands: true,
              maxLines: 4,
              minLines: 1,
              enableInteractiveSelection: false,
              // keyboardType: TextInputType.multiline,
              controller: _textController,
              onSubmitted: _isComposing ? widget.addNewMessage : null,
              onChanged: (String text) {
                setState(() => _isComposing = text.isNotEmpty);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Send a message',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 14),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _isComposing ? _handleSubmitted : null,
          ),
        ],
      ),
    );
  }
}
