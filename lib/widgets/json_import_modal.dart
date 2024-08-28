import 'package:flutter/material.dart';

class JsonImportModal extends StatelessWidget {
  final void Function(String) onSubmit;

  const JsonImportModal({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController jsonController = TextEditingController();

    return AlertDialog(
      title: const Text('Import JSON'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Paste your JSON below:'),
          const SizedBox(height: 10),
          TextField(
            controller: jsonController,
            maxLines: 10,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter JSON here...',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String json = jsonController.text;
            onSubmit(json);
            Navigator.of(context).pop();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
