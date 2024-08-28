part of 'json_bloc.dart';

@freezed
class JsonState with _$JsonState {
  factory JsonState({
    required JsonData json,
    required String representation,
  }) = _JsonState;

  factory JsonState.initial() => JsonState(
        json: JsonData(
          title: '',
          description: '',
          buttonText: '',
          buttonNavigation: '',
          closeButtonNavigation: '',
          titleColor: '',
          buttonColor: '',
          modalBackgroundColor: '',
          bodyPadding: 8,
          buttonPadding: 8,
          isError: false,
          redirectURL: '',
        ),
        representation: const JsonEncoder.withIndent('    ')
            .convert(JsonData.empty().toJson()),
      );
}
