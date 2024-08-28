// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_editor_web/application/json/json_bloc.dart';
import 'package:json_editor_web/widgets/json_editor_block.dart';
import 'package:json_editor_web/widgets/live_json_block.dart';

class JsonEditorApp extends StatelessWidget {
  const JsonEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Prompt JSON Editor',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: JsonEditorPage(),
    );
  }
}

class JsonEditorPage extends StatelessWidget {
  const JsonEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JsonBloc()
        ..add(
          const JsonEvent.onStartup(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Prompt JSON Editor'),
          elevation: 8,
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JsonEditorBlock(),
              SizedBox(width: 16),
              LiveJsonBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
