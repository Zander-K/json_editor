// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_editor_web/constants/spacing_constants.dart';
import 'package:json_editor_web/enums/navigation_options.dart';
import 'package:json_editor_web/widgets/dropdown.dart';
import 'package:json_editor_web/widgets/text_field.dart';
import 'package:json_editor_web/widgets/url_testing_text_field.dart';

class JsonEditorApp extends StatelessWidget {
  const JsonEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'JSON Editor',
      home: JsonEditorPage(),
    );
  }
}

enum JsonKeys {
  title,
  description,
  buttonText,
  buttonNavigation,
  closeButtonNavigation,
  titleColor,
  buttonColor,
  modalBackgroundColor,
  bodyPadding,
  buttonPadding,
  isError,
  redirectURL,
}

class JsonEditorPage extends StatefulWidget {
  const JsonEditorPage({super.key});

  @override
  _JsonEditorPageState createState() => _JsonEditorPageState();
}

class _JsonEditorPageState extends State<JsonEditorPage> {
  final Map<JsonKeys, TextEditingController> _controllers = {
    for (JsonKeys key in JsonKeys.values)
      if (key != JsonKeys.isError &&
          key != JsonKeys.bodyPadding &&
          key != JsonKeys.buttonPadding &&
          key != JsonKeys.redirectURL)
        key: TextEditingController(),
    JsonKeys.redirectURL: TextEditingController(),
  };

  NavigationOptions _buttonNavigation = NavigationOptions.home; // Default value
  NavigationOptions _closeButtonNavigation =
      NavigationOptions.home; // Default value

  bool _isError = false;
  int _bodyPadding = 4;
  int _buttonPadding = 4;
  final List<int> _paddingOptions = [8, 12, 16, 20, 24, 36];
  final textFieldPadding = SpacingConstants.vertical4;

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Editor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: _capitalize(JsonKeys.title.name),
                      controller: _controllers[JsonKeys.title]!,
                    ),
                    CustomTextField(
                      label: _capitalize(JsonKeys.description.name),
                      controller: _controllers[JsonKeys.description]!,
                    ),
                    CustomTextField(
                      label: _capitalize(JsonKeys.buttonText.name),
                      controller: _controllers[JsonKeys.buttonText]!,
                    ),
                    CustomDropdown<NavigationOptions>(
                      label: _capitalize(JsonKeys.buttonNavigation.name),
                      value: _buttonNavigation,
                      items: NavigationOptions.values,
                      onChanged: (value) {
                        setState(() {
                          _buttonNavigation = value!;
                        });
                      },
                    ),
                    CustomDropdown<NavigationOptions>(
                      label: _capitalize(JsonKeys.closeButtonNavigation.name),
                      value: _closeButtonNavigation,
                      items: NavigationOptions.values,
                      onChanged: (value) {
                        setState(() {
                          _closeButtonNavigation = value!;
                        });
                      },
                    ),
                    CustomTextField(
                      label: _capitalize(JsonKeys.titleColor.name),
                      controller: _controllers[JsonKeys.titleColor]!,
                    ),
                    CustomTextField(
                      label: _capitalize(JsonKeys.buttonColor.name),
                      controller: _controllers[JsonKeys.buttonColor]!,
                    ),
                    CustomTextField(
                      label: _capitalize(JsonKeys.modalBackgroundColor.name),
                      controller: _controllers[JsonKeys.modalBackgroundColor]!,
                    ),
                    CustomDropdown<int>(
                      label: _capitalize(JsonKeys.bodyPadding.name),
                      value: 8,
                      items: _paddingOptions,
                      onChanged: (value) {
                        setState(() {
                          _bodyPadding = value!;
                        });
                      },
                    ),
                    CustomDropdown<int>(
                      label: _capitalize(JsonKeys.buttonPadding.name),
                      value: 8,
                      items: _paddingOptions,
                      onChanged: (value) {
                        setState(() {
                          _buttonPadding = value!;
                        });
                      },
                    ),
                    CustomDropdown<bool>(
                      label: _capitalize(JsonKeys.isError.name),
                      value: _isError,
                      items: const [true, false],
                      onChanged: (value) {
                        setState(() {
                          _isError = value!;
                        });
                      },
                    ),
                    UrlTestingTextField(
                      label: _capitalize(JsonKeys.redirectURL.name),
                      controller: _controllers[JsonKeys.redirectURL]!,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: _generateJson,
                        child: const Text('Generate JSON'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  void _generateJson() {
    Map<String, dynamic> jsonMap = {
      for (var key in JsonKeys.values)
        if (key != JsonKeys.isError &&
            key != JsonKeys.bodyPadding &&
            key != JsonKeys.buttonPadding &&
            key != JsonKeys.buttonNavigation &&
            key != JsonKeys.closeButtonNavigation)
          key.name: _controllers[key]?.text,
      JsonKeys.buttonNavigation.name: _buttonNavigation.name,
      JsonKeys.closeButtonNavigation.name: _closeButtonNavigation.name,
      JsonKeys.bodyPadding.name: _bodyPadding,
      JsonKeys.buttonPadding.name: _buttonPadding,
      JsonKeys.isError.name: _isError,
      JsonKeys.redirectURL.name: _controllers[JsonKeys.redirectURL]!.text,
    };

    String jsonString = jsonEncode(jsonMap);
    if (kDebugMode) {
      print(jsonString);
    }

    Clipboard.setData(ClipboardData(text: jsonString));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('JSON copied to clipboard!')),
    );
  }
}
