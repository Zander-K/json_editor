import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:json_editor_web/application/json/json_bloc.dart';
import 'package:json_editor_web/widgets/json_import_modal.dart';

class LiveJsonBlock extends HookWidget {
  const LiveJsonBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonBloc, JsonState>(
      builder: (context, state) {
        return Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
              child: Column(
                children: [
                  const Text(
                    "Live JSON Representation:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SelectableText(
                        state.representation,
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _generateJson(context, state);
                      },
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(8),
                          fixedSize: MaterialStatePropertyAll(Size(148, 48))),
                      child: const Text('Generate JSON'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (innerContext) {
                            return JsonImportModal(
                              onSubmit: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onImportJson(value: value),
                                    );
                              },
                              onChanged: (_) {},
                            );
                          },
                        );
                      },
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(8),
                          fixedSize: MaterialStatePropertyAll(Size(148, 48))),
                      child: const Text('Import JSON'),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _generateJson(
    BuildContext context,
    JsonState state,
  ) {
    if (kDebugMode) {
      print(state.representation);
    }

    Clipboard.setData(ClipboardData(text: state.representation));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('JSON copied to clipboard!')),
    );
  }
}
