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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Live JSON Representation:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Tooltip(
                        message: 'Copy JSON',
                        child: IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: state.representation));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('JSON copied to clipboard!')),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Card(
                    color: const Color(0xFFF7F7F9),
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
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _generateJson(context, state);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        fixedSize: const Size(180, 48),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      icon: const Icon(Icons.code),
                      label: const Text('Generate JSON'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
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
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        fixedSize: const Size(180, 48),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Import JSON'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  /// Modal Preview Button
                  // Center(
                  //   child: Tooltip(
                  //     message: state.json.isEmpty ? 'Add data to enable preview' : '',
                  //     child: ElevatedButton(
                  //       onPressed: state.json.isEmpty
                  //           ? null
                  //           : () async {
                  //               await showDialog(
                  //                 context: context,
                  //                 builder: (innerContext) {
                  //                   final json = state.json;
                  //                   return Dialog(
                  //                     shape: RoundedRectangleBorder(
                  //                       borderRadius: BorderRadius.circular(16),
                  //                     ),
                  //                     child: Padding(
                  //                       padding: EdgeInsets.all(json.bodyPadding?.toDouble() ?? 16),
                  //                       child: Column(
                  //                         mainAxisSize: MainAxisSize.min,
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           Container(
                  //                             width: double.infinity,
                  //                             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  //                             decoration: BoxDecoration(
                  //                               color: _getHeaderColor(json.headerStyle),
                  //                               borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  //                             ),
                  //                             child: Text(
                  //                               json.title ?? '',
                  //                               style: const TextStyle(
                  //                                 fontWeight: FontWeight.bold,
                  //                                 fontSize: 18,
                  //                                 color: Colors.white,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 16),
                  //                           Text(json.description ?? ''),
                  //                           const SizedBox(height: 24),
                  //                           Row(
                  //                             mainAxisAlignment: MainAxisAlignment.end,
                  //                             children: [
                  //                               ElevatedButton(
                  //                                 onPressed: () {
                  //                                   Navigator.of(innerContext).pop();
                  //                                 },
                  //                                 style: ButtonStyle(
                  //                                   padding: WidgetStatePropertyAll(
                  //                                     EdgeInsets.all(json.buttonPadding?.toDouble() ?? 12),
                  //                                   ),
                  //                                 ),
                  //                                 child: Text(json.buttonText ?? 'OK'),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               );
                  //             },
                  //       style: const ButtonStyle(
                  //           elevation: WidgetStatePropertyAll(8),
                  //           fixedSize: WidgetStatePropertyAll(Size(148, 48))),
                  //       child: const Text('Preview Modal'),
                  //     ),
                  //   ),
                  // ),
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

// Color _getHeaderColor(String? headerStyle) {
//   switch (headerStyle) {
//     case 'Primary':
//       return Colors.blue;
//     case 'Secondary':
//       return Colors.purple;
//     case 'Tertiary':
//       return Colors.teal;
//     case 'Success':
//       return Colors.greenAccent;
//     case 'Warning':
//       return Colors.orange;
//     case 'Error':
//       return Colors.redAccent;
//     case 'White':
//       return Colors.white;
//     case 'Black':
//       return Colors.black;
//     default:
//       return Colors.blueGrey;
//   }
// }
