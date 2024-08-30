import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_editor_web/application/json/json_bloc.dart';
import 'package:json_editor_web/presentation/json_builder/json_editor_page.dart';
import 'package:json_editor_web/presentation/json_preview/json_preview_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JsonBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Prompt JSON Editor'),
          elevation: 8,
        ),
        body: Row(
          children: [
            JsonEditorPage(),
            JsonPreviewPage(),
          ],
        ),
      ),
    );
  }
}
