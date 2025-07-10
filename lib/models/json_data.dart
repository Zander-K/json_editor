import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_data.freezed.dart';
part 'json_data.g.dart';

@freezed
class JsonData with _$JsonData {
  JsonData._();

  factory JsonData({
    required String? title,
    required String? description,
    required String? buttonText,
    required String? buttonNavigation,
    required String? closeButtonNavigation,
    required String? headerStyle,
    required int? bodyPadding,
    required int? buttonPadding,
    required String? redirectURL,
  }) = _JsonData;

  factory JsonData.empty() => JsonData(
        title: '',
        description: '',
        buttonText: '',
        buttonNavigation: '',
        closeButtonNavigation: '',
        headerStyle: '',
        bodyPadding: null,
        buttonPadding: null,
        redirectURL: '',
      );

  factory JsonData.fromJson(Map<String, dynamic> json) =>
      _$JsonDataFromJson(json);

  // bool get isEmpty =>
  //     (title == null || title!.isEmpty) &&
  //     (description == null || description!.isEmpty) &&
  //     (buttonText == null || buttonText!.isEmpty) &&
  //     (buttonNavigation == null || buttonNavigation!.isEmpty) &&
  //     (closeButtonNavigation == null || closeButtonNavigation!.isEmpty) &&
  //     (headerStyle == null || headerStyle!.isEmpty) &&
  //     (bodyPadding == null || bodyPadding == 8) &&
  //     (buttonPadding == null || buttonPadding == 8) &&
  //     (redirectURL == null || redirectURL!.isEmpty);

  // bool get isNotEmpty => !isEmpty;
}
