// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:json_editor_web/presentation/main_page.dart';

class JsonEditorApp extends StatelessWidget {
  const JsonEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Prompt JSON Editor',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
