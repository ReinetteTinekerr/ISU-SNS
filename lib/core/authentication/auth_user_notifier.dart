import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:university_chat_app/constants/constants.dart';
import 'package:university_chat_app/utils/services/fire_auth_exception.dart';
import 'package:university_chat_app/utils/services/fire_auth_service.dart';

part 'auth_user_notifier.freezed.dart';

@freezed
class AuthUserState with _$AuthUserState {
  const AuthUserState._();
  const factory AuthUserState.initial() = _Initial;
  const factory AuthUserState.authenticated() = _Authenticated;
  const factory AuthUserState.unauthenticated() = _UnAuthenticated;
  const factory AuthUserState.failure() = _Failure;
}

class AuthUserNotifier extends StateNotifier<AuthUserState> {
  AuthUserNotifier({required this.authService})
      : super(const AuthUserState.initial());

  final FireAuthService authService;

  Future<void> checkAndUpdateAuthStatus() async {
    state = authService.isEmailVerified
        ? const AuthUserState.authenticated()
        : const AuthUserState.unauthenticated();
  }

  Future<void> signInWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final failureOrSuccess =
        await authService.signInWithEmailAndPassword(email, password);
    failureOrSuccess.fold(
      (l) => FireAuthExceptionFlushbar(
        service: authService,
        context: context,
        error: l,
      ),
      (r) => state = const AuthUserState.authenticated(),
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String displayName,
    required String password,
  }) async {
    final failureOrSuccess = await authService.createUserWithEmailAndPassword(
      email,
      displayName,
      password,
    );

    failureOrSuccess.fold(
      (l) => FireAuthExceptionFlushbar(
        service: authService,
        context: context,
        error: l,
      ),
      (r) {
        if (authService.isEmailVerified) {
          state = const AuthUserState.authenticated();
          return;
        }
        CustomFlushbar.show(
          context: context,
          message: 'Check your email address for verification',
        ).then(
          (value) => CustomFlushbar.show(
            context: context,
            message: 'Waiting for email verification',
            hasCircularProgressIndicator: true,
          ),
        );

        Future(() async {
          Timer.periodic(const Duration(seconds: 3), (timer) async {
            authService.auth.currentUser?.reload();
            if (authService.isEmailVerified) {
              timer.cancel();
              state = const AuthUserState.authenticated();
            }
          });
        });
      },
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final failureOrSuccess = await authService.signInWithGoogle();
    failureOrSuccess.fold(
      (l) => FireAuthExceptionFlushbar(
        service: authService,
        context: context,
        error: l,
      ),
      (r) => state = const AuthUserState.authenticated(),
    );
  }

  Future<void> signOut({required BuildContext context}) async {
    final failureOrSuccess = await authService.signOut();
    failureOrSuccess.fold(
      (l) => FireAuthExceptionFlushbar(
        service: authService,
        context: context,
        error: l,
      ),
      (r) => state = const AuthUserState.unauthenticated(),
    );
  }
}
