import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:university_chat_app/domain/models/chat_message.dart';
import 'package:university_chat_app/widgets/chat.dart';
import 'package:university_chat_app/widgets/chat_navigation_tab_bar.dart';
import 'package:university_chat_app/widgets/chat_settings.dart';
import 'package:university_chat_app/widgets/pinned_chats.dart';

class ChatDetailsPage extends StatefulWidget {
  const ChatDetailsPage({Key? key, @PathParam('id') required this.chatID})
      : super(key: key);
  final String chatID;

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage>
    with SingleTickerProviderStateMixin {
  final List<ChatMessage> messages = [
    ChatMessage(messageContent: 'Hello, Will', messageType: 'receiver'),
    ChatMessage(messageContent: 'How have you been?', messageType: 'receiver'),
    ChatMessage(
      messageContent: 'Hey Kriss, I am doing fine dude. wbu?',
      messageType: 'sender',
    ),
    ChatMessage(messageContent: 'ehhhh, doing OK.', messageType: 'receiver'),
    ChatMessage(
      messageContent: 'Is there any thing wrong?',
      messageType: 'sender',
    ),
  ];

  ScrollController scrollController = ScrollController();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(208, 244, 244, 1),
        // backgroundColor: const Color.fromRGBO(207, 235, 210, 1),
        title: Text('${widget.chatID}'),
        actions: const [
          PinnedChats(),
          ChatSettings(),
        ],
      ),
      // backgroundColor: Color.fromRGBO(208, 244, 244, 1),
      // backgroundColor: Colors.white,
      body: Container(
        // color: Color.fromRGBO(208, 244, 244, 1),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     // stops: [0.1, 0.5, 0.7, 0.9],
        //     colors: [
        //       // Color.fromRGBO(137, 247, 254, 1),
        //       // Color.fromRGBO(102, 166, 255, 1)
        //       // Color.fromRGBO(19, 84, 122, 1),
        //       // Color.fromRGBO(128, 208, 199, 1)
        //       // Color.fromRGBO(208, 244, 244, 1),
        //       // Colors.black,
        //     ],
        //   ),
        // ),
        child: Column(
          children: [
            ChatNavigationTabBar(
              tabs: const [Tab(text: 'Chat'), Tab(text: 'Posts')],
              tabController: _tabController,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Chat(
                    messages: messages,
                    scrollController: scrollController,
                  ),
                  const Text('Posts')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
