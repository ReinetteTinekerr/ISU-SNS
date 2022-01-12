import 'package:flutter/material.dart';
import 'package:university_chat_app/constants/enums.dart';
import 'package:university_chat_app/core/pages/init.dart';
import 'package:university_chat_app/domain/data/data.dart';
import 'package:university_chat_app/domain/models/chat_users.dart';
import 'package:university_chat_app/widgets/chat_item_list.dart';
import 'package:university_chat_app/widgets/chat_navigation_tab_bar.dart';
import 'package:university_chat_app/widgets/search_bar.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage>
    with SingleTickerProviderStateMixin {
  static const routeName = ChatRoute.chats;
  late final TabController _tabController;
  final List<ChatMessage> chatUsers = [
    ChatMessage(
        title: '',
        type: ChatType.user,
        user: onlineUsers[0],
        messageText: 'Awesome Setup',
        imageURL: "images/userImage1.jpeg",
        time: "Now"),
    ChatMessage(
        title: '',
        type: ChatType.user,
        user: onlineUsers[1],
        messageText: "That's Great",
        imageURL: "images/userImage2.jpeg",
        time: "Yesterday"),
    ChatMessage(
        type: ChatType.user,
        user: onlineUsers[2],
        title: 'Jorge Henry',
        messageText: "Hey where are you?",
        imageURL: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatMessage(
        type: ChatType.user,
        user: onlineUsers[3],
        title: 'Philip Fox',
        messageText: "Busy! Call me in 20 mins",
        imageURL: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatMessage(
        type: ChatType.user,
        user: onlineUsers[4],
        title: 'Debra Hawkins',
        messageText: "Thankyou, It's awesome",
        imageURL: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatMessage(
        type: ChatType.user,
        user: onlineUsers[5],
        title: 'Jacob Pena',
        messageText: "will update you in evening",
        imageURL: "images/userImage6.jpeg",
        time: "17 Mar"),
    ChatMessage(
        type: ChatType.user,
        user: onlineUsers[6],
        title: 'Andrey Jones',
        messageText: "Can you please share the file?",
        imageURL: "images/userImage7.jpeg",
        time: "24 Feb"),
    ChatMessage(
        type: ChatType.subject,
        title: 'Software Engineering 1',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.subject,
        title: 'Discrete Structure',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.subject,
        user: onlineUsers[0],
        title: 'Automata Theory and Formal Languages',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.subject,
        user: onlineUsers[0],
        title: 'Information Assurance and Securty 1',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.group,
        user: onlineUsers[0],
        title: 'My Secret Group',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.group,
        user: onlineUsers[0],
        title: 'group chat 1',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.group,
        user: onlineUsers[0],
        title: 'BSCS-3',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.group,
        user: onlineUsers[0],
        title: 'CCSICT group',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.group,
        title: 'Project X',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.group,
        title: 'Project Y',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
    ChatMessage(
        type: ChatType.group,
        title: 'Project Z',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Chats'),
      body: Column(
        children: [
          SearchBar(),
          ChatNavigationTabBar(
            tabController: _tabController,
            tabs: const [
              Tab(text: 'Messages'),
              Tab(text: 'Subjects'),
              Tab(text: 'Groups'),
            ],
          ),
          const SizedBox(height: 2),
          Expanded(
            child: TabBarView(
              children: [
                ChatItemList(
                  chatUsers: chatUsers
                      .where((element) => element.type == ChatType.user)
                      .toList(),
                  routeName: routeName,
                ),
                ChatItemList(
                  chatUsers: chatUsers
                      .where((element) => element.type == ChatType.subject)
                      .toList(),
                  routeName: routeName,
                ),
                ChatItemList(
                  chatUsers: chatUsers
                      .where((element) => element.type == ChatType.group)
                      .toList(),
                  routeName: routeName,
                ),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
