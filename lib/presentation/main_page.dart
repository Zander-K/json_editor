import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_editor_web/application/json/json_bloc.dart';
import 'package:json_editor_web/constants/spacing_constants.dart';
import 'package:json_editor_web/widgets/json_editor_block.dart';
import 'package:json_editor_web/widgets/live_json_block.dart';

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
        body: const Row(
          children: [
            JsonEditorBlock(),
            gap16,
            LiveJsonBlock(),
          ],
        ),
      ),
    );
  }
}
