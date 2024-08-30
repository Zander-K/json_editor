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
          emit(
            state.copyWith(
              json: state.json.copyWith(
                buttonText: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.buttonText.key,
                e.value,
              ),
            ),
          );
        },
        onChangedButtonNavigation: (e) {
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
        onChangedButtonColor: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                buttonColor: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.buttonColor.key,
                e.value,
              ),
            ),
          );
        },
        onChangedModalBackgroundColor: (e) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                modalBackgroundColor: e.value,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.modalBackgroundColor.key,
                e.value,
              ),
            ),
          );
        },
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
        onChangedIsError: (_) {
          emit(
            state.copyWith(
              json: state.json.copyWith(
                isError: !state.json.isError,
              ),
              representation: updateJsonRepresentation(
                state.representation,
                JsonKeys.isError.key,
                !state.json.isError,
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
          final jsonMap = jsonDecode(e.value ?? '{}');

          final json = JsonData.fromJson(jsonMap);

          emit(
            state.copyWith(
              importedData: true,
              json: json,
              representation:
                  const JsonEncoder.withIndent('    ').convert(jsonMap),
            ),
          );
          emit(state.copyWith(importedData: false));
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

    if (jsonMap[key] == null || jsonMap[key] == '') {
      jsonMap.addAll({key: newValue});
    } else {
      jsonMap[key] = newValue;
    }

    final newJson = const JsonEncoder.withIndent('    ').convert(jsonMap);

    return newJson;
  }
}
