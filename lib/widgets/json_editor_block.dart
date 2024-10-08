import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_editor_web/application/json/json_bloc.dart';
import 'package:json_editor_web/enums/color_options.dart';
import 'package:json_editor_web/enums/json_keys.dart';
import 'package:json_editor_web/enums/navigation_options.dart';
import 'package:json_editor_web/enums/padding_options.dart';
import 'package:json_editor_web/utils/capitalize.dart';
import 'package:json_editor_web/utils/extensions.dart';
import 'package:json_editor_web/widgets/shared/export.dart';

class JsonEditorBlock extends StatelessWidget {
  const JsonEditorBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController =
        TextEditingController(text: JsonKeys.title.defaultValue.toString());
    final descriptionController = TextEditingController(
        text: JsonKeys.description.defaultValue.toString());
    final buttonTextController = TextEditingController(
        text: JsonKeys.buttonText.defaultValue.toString());
    final buttonNavigationController = TextEditingController(
        text: JsonKeys.buttonNavigation.defaultValue.toString());
    final closeButtonNavigationController = TextEditingController(
        text: JsonKeys.closeButtonNavigation.defaultValue.toString());
    final titleColorController = TextEditingController(
        text: JsonKeys.titleColor.defaultValue.toString());
    // final buttonColorController = TextEditingController(
    //     text: JsonKeys.buttonColor.defaultValue.toString());
    // final modalBackgroundColorController = TextEditingController(
    //     text: JsonKeys.modalBackgroundColor.defaultValue.toString());
    final bodyPaddingController = TextEditingController(
        text: JsonKeys.bodyPadding.defaultValue.toString());
    final buttonPaddingController = TextEditingController(
        text: JsonKeys.buttonPadding.defaultValue.toString());
    final hasErrorController =
        TextEditingController(text: JsonKeys.hasError.defaultValue.toString());
    final redirectURLController = TextEditingController(
        text: JsonKeys.redirectURL.defaultValue.toString());

    return BlocListener<JsonBloc, JsonState>(
      listenWhen: (previous, current) {
        return previous != current &&
            !current.importedData &&
            previous.importedData;
      },
      listener: (context, state) {
        titleController.text = state.json.title ?? '';
        descriptionController.text = state.json.description ?? '';
        buttonTextController.text = state.json.buttonText ?? '';
        buttonNavigationController.text = state.json.buttonNavigation ?? 'null';
        closeButtonNavigationController.text =
            state.json.closeButtonNavigation ?? '';
        titleColorController.text = state.json.titleColor ?? '';
        // buttonColorController.text = state.json.buttonColor ?? '';
        // modalBackgroundColorController.text =
        //     state.json.modalBackgroundColor ?? '';
        bodyPaddingController.text = state.json.bodyPadding.toString();
        buttonPaddingController.text = state.json.buttonPadding.toString();
        hasErrorController.text = state.json.hasError.toString();
        redirectURLController.text = state.json.redirectURL ?? '';
      },
      child: BlocBuilder<JsonBloc, JsonState>(
        builder: (context, state) {
          return Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "JSON Builder:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
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
                              label: capitalize(JsonKeys.title.name),
                              hintText: JsonKeys.title.hintText,
                              controller: titleController,
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedTitle(value: value),
                                    );
                              },
                            ),
                            CustomTextField(
                              label: capitalize(JsonKeys.description.name),
                              hintText: JsonKeys.description.hintText,
                              controller: descriptionController,
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedDescription(
                                          value: value),
                                    );
                              },
                            ),
                            CustomTextField(
                              label: capitalize(JsonKeys.buttonText.name),
                              hintText: JsonKeys.buttonText.hintText,
                              controller: buttonTextController,
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedButtonText(
                                          value: value),
                                    );
                              },
                            ),
                            CustomDropdown<String>(
                              label: capitalize(JsonKeys.buttonNavigation.name),
                              hintText: JsonKeys.buttonNavigation.hintText,
                              value: buttonNavigationController.text,
                              items: NavigationOptions.values
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedButtonNavigation(
                                          value: value ?? ''),
                                    );
                              },
                            ),
                            CustomDropdown<String>(
                              label: capitalize(
                                  JsonKeys.closeButtonNavigation.name),
                              hintText: JsonKeys.closeButtonNavigation.hintText,
                              value: closeButtonNavigationController.text,
                              items: NavigationOptions.values
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedCloseButtonNavigation(
                                          value: value ?? ''),
                                    );
                              },
                            ),
                            CustomDropdown<String>(
                              label: capitalize(JsonKeys.titleColor.name),
                              hintText: JsonKeys.titleColor.hintText,
                              value: titleColorController.text,
                              items: ColorOptions.values
                                  .map((e) => e.value)
                                  .toList(),
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedTitleColor(
                                          value: value.toString()),
                                    );
                              },
                            ),
                            // CustomDropdown<String>(
                            //   label: capitalize(JsonKeys.buttonColor.name),
                            //   hintText: JsonKeys.buttonColor.hintText,
                            //   value: buttonColorController.text,
                            //   items: ColorOptions.values
                            //       .map((e) => e.value)
                            //       .toList(),
                            //   onChanged: (value) {
                            //     context.read<JsonBloc>().add(
                            //           JsonEvent.onChangedButtonColor(
                            //               value: value ?? ''),
                            //         );
                            //   },
                            // ),
                            // CustomDropdown<String>(
                            //   label: capitalize(
                            //       JsonKeys.modalBackgroundColor.name),
                            //   hintText: JsonKeys.modalBackgroundColor.hintText,
                            //   value: modalBackgroundColorController.text,
                            //   items: ColorOptions.values
                            //       .map((e) => e.value)
                            //       .toList(),
                            //   onChanged: (value) {
                            //     context.read<JsonBloc>().add(
                            //           JsonEvent.onChangedModalBackgroundColor(
                            //               value: value ?? ''),
                            //         );
                            //   },
                            // ),
                            CustomDropdown<int>(
                              label: capitalize(JsonKeys.bodyPadding.name),
                              hintText: JsonKeys.bodyPadding.hintText,
                              value: bodyPaddingController.text.asInt,
                              items: PaddingOptions.values
                                  .map((e) => e.value)
                                  .toList(),
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedBodyPadding(
                                          value: value),
                                    );
                              },
                            ),
                            CustomDropdown<int>(
                              label: capitalize(JsonKeys.buttonPadding.name),
                              hintText: JsonKeys.buttonPadding.hintText,
                              value: buttonPaddingController.text.asInt,
                              items: PaddingOptions.values
                                  .map((e) => e.value)
                                  .toList(),
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedButtonPadding(
                                          value: value),
                                    );
                              },
                            ),
                            CustomDropdown<bool>(
                              label: capitalize(JsonKeys.hasError.name),
                              hintText: JsonKeys.hasError.hintText,
                              value: hasErrorController.text.asBool,
                              items: const [true, false],
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedHasError(value: value),
                                    );
                              },
                            ),
                            UrlTestingTextField(
                              label: capitalize(JsonKeys.redirectURL.name),
                              hintText: JsonKeys.redirectURL.hintText,
                              controller: redirectURLController,
                              onChanged: (value) {
                                context.read<JsonBloc>().add(
                                      JsonEvent.onChangedRedirectURL(
                                          value: value),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
