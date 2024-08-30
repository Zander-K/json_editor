import 'package:flutter/material.dart';
import 'package:json_editor_web/widgets/json_editor_block.dart';

class JsonEditorPage extends StatelessWidget {
  const JsonEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JsonEditorBlock(),
          SizedBox(width: 16),
          // LiveJsonBlock(),
        ],
      ),
    );
  }
}
