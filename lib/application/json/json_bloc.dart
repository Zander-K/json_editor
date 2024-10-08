import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_editor_web/enums/json_keys.dart';
import 'package:json_editor_web/models/json_data.dart';

part 'json_state.dart';
part 'json_event.dart';
part 'json_bloc.freezed.dart';

class JsonBloc extends Bloc<JsonEvent, JsonState> {
  JsonBloc() : super(JsonState.initial()) {
    on<JsonEvent>((event, emit) {
      event.map(
        onStartup: (e) {
          emit(
            state.copyWith(
              json: JsonData.empty(),
            ),
          );
        },
        onChangedTitle: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                title: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.title.key,
                e.value,
              ),
            ),
          );
        },
        onChangedDescription: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                description: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.description.key,
                e.value,
              ),
            ),
          );
        },
        onChangedButtonText: (e) {
          // Whatever needs to happen without updating your UI {
          final updatedState = state.copyWith(
            json: state.json.copyWith(
              buttonText: e.value,
            ),
            representation: updateJsonRepresentation(
              state.representation,
              JsonKeys.buttonText.key,
              e.value,
            ),
          );
          // }

          // Only when you want your UI to update, you will EMIT a new state.
          emit(updatedState);
        },
        onChangedButtonNavigation: (e) {
          final closeButton = state.json.closeButtonNavigation;
          if (closeButton != null && closeButton.isNotEmpty) {
            emit(
              state.copyWith(
                json: state.json.copyWith(
                  buttonNavigation: e.value,
                ),
                representation: updateJsonRepresentation(
                  state.representation,
                  JsonKeys.buttonNavigation.key,
                  e.value,
                ),
              ),
            );
          } else {
            emit(
              state.copyWith(
                json: state.json.copyWith(
                  buttonNavigation: e.value,
                  closeButtonNavigation: e.value,
                ),
                representation: updateJsonRepresentation(
                  state.representation,
                  JsonKeys.buttonNavigation.key,
                  e.value,
                ),
              ),
            );
          }

          emit(
            state.copyWith(
              json: state.json.copyWith(
                buttonNavigation: e.value,
                closeButtonNavigation: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.buttonNavigation.key,
                e.value,
              ),
            ),
          );
        },
        onChangedCloseButtonNavigation: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                closeButtonNavigation: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.closeButtonNavigation.key,
                e.value,
              ),
            ),
          );
        },
        onChangedTitleColor: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                titleColor: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.titleColor.key,
                e.value,
              ),
            ),
          );
        },
        // onChangedButtonColor: (e) {
        //   emit(
        //     state.copyWith(
        //       json: state.json.copyWith(
        //         buttonColor: e.value,
        //       ),
        //       representation: updateJsonRepresentation(
        //         state.representation,
        //         JsonKeys.buttonColor.key,
        //         e.value,
        //       ),
        //     ),
        //   );
        // },
        // onChangedModalBackgroundColor: (e) {
        //   emit(
        //     state.copyWith(
        //       json: state.json.copyWith(
        //         modalBackgroundColor: e.value,
        //       ),
        //       representation: updateJsonRepresentation(
        //         state.representation,
        //         JsonKeys.modalBackgroundColor.key,
        //         e.value,
        //       ),
        //     ),
        //   );
        // },
        onChangedBodyPadding: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                bodyPadding: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.bodyPadding.key,
                e.value,
              ),
            ),
          );
        },
        onChangedButtonPadding: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                buttonPadding: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.buttonPadding.key,
                e.value,
              ),
            ),
          );
        },
        onChangedHasError: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                hasError: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.hasError.key,
                e.value,
              ),
            ),
          );
        },
        onChangedRedirectURL: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                redirectURL: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.redirectURL.key,
                e.value,
              ),
            ),
          );
        },
        onImportJson: (e) {
          emit(state.copyWith(importedData: true));

          final jsonMap = jsonDecode(e.value ?? '{}');

          final json = JsonData.fromJson(jsonMap);

          emit(
            state.copyWith(
              importedData: false,
              json: json,
              representation:
                  const JsonEncoder.withIndent('    ').convert(jsonMap),
            ),
          );
        },
      );
    });
  }

  String updateJsonRepresentation(
    String representation,
    String key,
    dynamic newValue,
  ) {
    Map<String, dynamic> jsonMap = jsonDecode(representation);
    final buttonKey = JsonKeys.buttonNavigation.key;
    final closeButtonKey = JsonKeys.closeButtonNavigation.key;

    if (jsonMap[key] == null || jsonMap[key] == '') {
      jsonMap.addAll({key: newValue});
    } else {
      jsonMap[key] = newValue;
    }

    /// Updates closeButtonNavigation to buttonNavigation if default
    if (key == buttonKey &&
        (jsonMap[closeButtonKey] == null || jsonMap[closeButtonKey] == '')) {
      jsonMap[closeButtonKey] = newValue;
    }

    final newJson = const JsonEncoder.withIndent('    ').convert(jsonMap);

    return newJson;
  }
}
