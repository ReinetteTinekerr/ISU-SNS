import 'package:flutter/material.dart';
import 'package:university_chat_app/constants/enums.dart';
import 'package:university_chat_app/core/pages/init.dart';
import 'package:university_chat_app/domain/models/chat_users.dart';
import 'package:university_chat_app/widgets/chat_item_list.dart';
import 'package:university_chat_app/widgets/search_bar.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);
  static const routeName = ChatRoute.programs;

  final List<ChatMessage> chatUsers = const [
    ChatMessage(
        type: ChatType.group,
        title: 'B.S. in Computer Science',
        messageText: 'Awesome Setup',
        imageURL: "images/userImage1.jpeg",
        time: "Now"),
    ChatMessage(
        type: ChatType.group,
        title: "B.S. in Information Technology",
        messageText: "That's Great",
        imageURL: "images/userImage2.jpeg",
        time: "Yesterday"),
    ChatMessage(
        type: ChatType.group,
        title: 'B.S. in Information Systems',
        messageText: "Hey where are you?",
        imageURL: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatMessage(
        type: ChatType.group,
        title: 'B.S. in Computer Engineering',
        messageText: "Busy! Call me in 20 mins",
        imageURL: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatMessage(
        type: ChatType.group,
        title: 'B.S. in Psychology',
        messageText: "Thankyou, It's awesome",
        imageURL: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatMessage(
        type: ChatType.group,
        title: 'B.S. in Agriculture',
        messageText: "will update you in evening",
        imageURL: "images/userImage6.jpeg",
        time: "17 Mar"),
    ChatMessage(
        type: ChatType.group,
        title: 'B.S. in Biology',
        messageText: "Can you please share the file?",
        imageURL: "images/userImage7.jpeg",
        time: "24 Feb"),
    ChatMessage(
        type: ChatType.group,
        title: 'B.S. in Mathematics',
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
  ];

  Future<void> showFormDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Course'),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                TextField(
                  decoration: InputDecoration(labelText: 'Course name'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Acronym'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Department'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('ADD'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Programs'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: ChatItemList(
              chatUsers: chatUsers,
              routeName: routeName,
            ),
          ),
        ],
      ),
    );
  }
}
