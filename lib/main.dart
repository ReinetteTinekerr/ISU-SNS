import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:university_chat_app/provider/providers.dart';
import 'app.dart';

const darkModeBox = 'darkMode';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: InitializeMyApp()));
}

final initializeSettingsProvider = FutureProvider<void>((ref) async {
  final settings = ref.watch(settingsControllerProvider.notifier);
  await settings.loadSettings();
});

class InitializeMyApp extends ConsumerWidget {
  const InitializeMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(initializeSettingsProvider);
    return const MyApp();
  }
}
