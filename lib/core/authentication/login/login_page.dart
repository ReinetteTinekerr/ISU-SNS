import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_form.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool _isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'App Name',
      //     style: GoogleFonts.aBeeZee(
      //       textStyle: const TextStyle(fontWeight: FontWeight.bold),
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      // backgroundColor: Theme.of(context).primaryColorDark,
      // backgroundColor:
      //     _isDarkTheme ? Theme.of(context).canvasColor : Colors.white,
      body: Center(child: SingleChildScrollView(child: LoginForm())),
    );
  }
}
