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
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'Easily build and preview your startup prompt JSON. Fill in the fields on the left, and see the live JSON update on the right. When you\'re ready, generate or import your JSON with a single click.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JsonEditorBlock(),
                  gap16,
                  LiveJsonBlock(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
