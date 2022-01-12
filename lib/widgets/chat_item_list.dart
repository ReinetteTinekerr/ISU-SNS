import 'package:flutter/material.dart';
import 'package:university_chat_app/config/routes/app_router.gr.dart';
import 'package:university_chat_app/constants/enums.dart';
import 'package:university_chat_app/domain/models/chat_users.dart';
import 'package:university_chat_app/widgets/chat_item_tile.dart';

class ChatItemList extends StatelessWidget {
  const ChatItemList({
    Key? key,
    required this.routeName,
    required this.chatUsers,
  }) : super(key: key);

  final List<ChatMessage> chatUsers;
  final ChatRoute routeName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: chatUsers.length,
      // shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        final chatTile = chatUsers[index];
        return ChatItemTile(
          index: index,
          title: chatTile.type == ChatType.user
              ? chatTile.user!.name
              : chatTile.title,
          messageText: chatUsers[index].messageText,
          imageUrl: chatUsers[index].imageURL,
          time: chatUsers[index].time,
          isMessageRead: (index == 0 || index == 3) ? true : false,
          // TODO move it to chat item tile
          onTap: () {
            switch (chatTile.type) {
              case ChatType.user:
                routeName.navigate(context, chatUsers[index].user!.name);
                break;
              case ChatType.group:
              case ChatType.subject:
                routeName.navigate(context, chatUsers[index].title);
                break;
            }
          },
        );
      },
    );
  }
}
