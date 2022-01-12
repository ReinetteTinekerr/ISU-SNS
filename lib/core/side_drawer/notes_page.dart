import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Notes'),
      ),
      body: const Center(
        child: Text('Empty Notes'),
      ),
    );
  }
}