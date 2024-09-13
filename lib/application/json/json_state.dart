part of 'json_bloc.dart';

@freezed
class JsonState with _$JsonState {
  factory JsonState({
    required JsonData json,
    required String representation,
    required bool importedData,
  }) = _JsonState;

  factory JsonState.initial() => JsonState(
        json: JsonData(
          title: '',
          description: '',
          buttonText: '',
          buttonNavigation: '',
          closeButtonNavigation: '',
          titleColor: '',
          // buttonColor: '',
          // modalBackgroundColor: '',
          bodyPadding: 8,
          buttonPadding: 8,
          hasError: false,
          redirectURL: '',
        ),
        representation: const JsonEncoder.withIndent('    ')
            .convert(JsonData.empty().toJson()),
        importedData: false,
      );
}
