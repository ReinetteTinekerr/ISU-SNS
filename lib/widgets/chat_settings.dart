import 'package:flutter/material.dart';
import 'package:university_chat_app/widgets/expand_modal_ui.dart';

class ChatSettings extends StatelessWidget {
  const ChatSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) {
                return Column(
                  children: const [
                    ExpandModalUI(title: 'Settings'),
                  ],
                );
              },
            );
          },
        );
      },
      icon: const Icon(Icons.settings),
    );
  }
}
