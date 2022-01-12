import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:university_chat_app/core/authentication/auth_user_notifier.dart';
import 'package:university_chat_app/core/settings/settings_controller.dart';
import 'package:university_chat_app/core/settings/settings_service.dart';
import 'package:university_chat_app/utils/services/fire_auth_service.dart';

// final settingsServiceProvider = Provider((ref) => SettingsService());

final settingsControllerProvider =
    StateNotifierProvider<SettingsControllerState, ThemeMode>(
  (ref) => SettingsControllerState(SettingsService()),
);

// Firebase Auth Providers Domain layer
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// final authStateChangesProvider = StreamProvider<User?>(
//   (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
// );

final fireAuthServiceProvider = Provider<FireAuthService>(
  (ref) => FireAuthService(
    ref.watch(firebaseAuthProvider),
  ),
);

// Application / Logic
final authUserNotifierProvider =
    StateNotifierProvider<AuthUserNotifier, AuthUserState>(
  (ref) => AuthUserNotifier(authService: ref.watch(fireAuthServiceProvider)),
);

// final databaseProvider = Provider<FirestoreDatabase?>((ref) {
//   final auth = ref.watch(authStateChangesProvider);

//   if (auth.data?.value?.uid != null) {
//     return FirestoreDatabase(uid: auth.data!.value!.uid);
//   }
//   return null;
// });

