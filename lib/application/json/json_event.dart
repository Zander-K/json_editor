part of 'json_bloc.dart';

@freezed
class JsonEvent with _$JsonEvent {
  const factory JsonEvent.onStartup() = OnStartup;
  const factory JsonEvent.onImportJson({required String? value}) = OnImportJson;
  const factory JsonEvent.onChangedTitle({required String value}) =
      OnChangedTitle;
  const factory JsonEvent.onChangedDescription({required String value}) =
      OnChangedDescription;
  const factory JsonEvent.onChangedButtonText({required String value}) =
      OnChangedButtonText;

  const factory JsonEvent.onChangedButtonNavigation({required String value}) =
      OnChangedButtonNavigation;
  const factory JsonEvent.onChangedCloseButtonNavigation(
      {required String value}) = OnChangedCloseButtonNavigation;

  const factory JsonEvent.onChangedHeaderStyle({required String value}) =
      OnChangedHeaderStyle;
  const factory JsonEvent.onChangedBodyPadding({required int? value}) =
      OnChangedBodyPadding;
  const factory JsonEvent.onChangedButtonPadding({required int? value}) =
      OnChangedButtonPadding;

  const factory JsonEvent.onChangedRedirectURL({required String value}) =
      OnChangedRedirectURL;
}
