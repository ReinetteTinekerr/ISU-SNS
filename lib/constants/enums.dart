import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:university_chat_app/config/routes/app_router.gr.dart';

enum Gender { male, female, unknown }
enum Occupation { student, universityFaculty, unknown }

extension SelectedGender on Gender {
  String get displayTitle {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      default:
        return 'Unknown';
    }
  }
}

extension SelectedOccupation on Occupation {
  String get displayTitle {
    switch (this) {
      case Occupation.student:
        return 'Student';
      case Occupation.universityFaculty:
        return 'University Faculty';
      case Occupation.unknown:
        return 'Unknown';
      default:
        return 'Not Specified';
    }
  }
}

enum ChatRoute {
  chats,
  departments,
  programs,
}

extension ChatRouteNavigation on ChatRoute {
  void navigate(
    BuildContext context,
    String chatID,
  ) {
    switch (this) {
      case ChatRoute.chats:
        context.router.navigate(
          MainRoute(
            children: [
              ChatsTab(children: [ChatDetailsRoute(chatID: chatID)])
            ],
          ),
        );
        break;
      case ChatRoute.departments:
        context.router.navigate(
          MainRoute(
            children: [
              DepartmentsTab(children: [SliverChatDetailsRoute(chatID: chatID)])
            ],
          ),
        );
        break;
      case ChatRoute.programs:
        context.router.navigate(
          MainRoute(
            children: [
              CoursesTab(children: [SliverChatDetailsRoute(chatID: chatID)])
            ],
          ),
        );
        break;
      default:
    }
  }
}
