import 'package:email_validator/email_validator.dart';
import 'package:university_chat_app/domain/data/data.dart';

class ChatMessage {
  const ChatMessage({
    required this.type,
    this.user,
    required this.messageText,
    required this.imageURL,
    required this.time,
    required this.title,
  });

  final String title;
  final String messageText;
  final String imageURL;
  final String time;
  final ChatType type;
  final FakeUser? user;
}

enum ChatType { user, subject, group }
