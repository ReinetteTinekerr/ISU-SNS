import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university_chat_app/constants/constants.dart';
import 'package:university_chat_app/utils/services/fire_auth_service.dart';

class FireAuthExceptionFlushbar {
  FireAuthExceptionFlushbar({
    required this.service,
    required this.context,
    required this.error,
  }) {
    _showErrorFlushbar(context, error);
  }

  final FirebaseAuthException error;
  final BuildContext context;
  final FireAuthService service;

  void _showErrorFlushbar(
    BuildContext context,
    FirebaseAuthException error,
  ) {
    switch (error.code) {
      case 'user-not-found':
        CustomFlushbar.show(
          context: context,
          message: error.message!,
          duration: const Duration(seconds: 5),
        );
        break;
      case 'email-already-in-use':
        if (service.isCurrentUserExists && service.isEmailVerified) {
          CustomFlushbar.show(
            context: context,
            duration: const Duration(seconds: 10),
            message:
                'Your email is not yet verified.\nSend a verification code',
            mainButton: OutlinedButton(
              child: const Text('Send'),
              onPressed: () {
                if (service.auth.currentUser != null) {
                  service.auth.currentUser!.sendEmailVerification();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }
              },
            ),
          );
        } else {
          CustomFlushbar.show(
            context: context,
            message: error.message!,
          );
        }
        break;
      default:
        CustomFlushbar.show(
          context: context,
          message: error.message!,
        );
    }
  }
}
