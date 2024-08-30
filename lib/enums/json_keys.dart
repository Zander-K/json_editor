enum JsonKeys {
  title('title', 'Title', ''),
  description('description', 'Description', ''),
  buttonText('buttonText', 'Button Text', ''),
  buttonNavigation('buttonNavigation', 'Button Navigation', null),
  closeButtonNavigation(
      'closeButtonNavigation', 'Close Button Navigation', null),
  titleColor('titleColor', 'Title Color', null),
  buttonColor('buttonColor', 'Button Color', null),
  modalBackgroundColor('modalBackgroundColor', 'Modal Background Color', null),
  bodyPadding('bodyPadding', 'Body Padding', null),
  buttonPadding('buttonPadding', 'Button Padding', null),
  isError('isError', 'Is Error', null),
  redirectURL('redirectURL', 'Redirect URL', '');

  const JsonKeys(this.key, this.name, this.defaultValue);

  final String key;
  final String name;
  final dynamic defaultValue;
}
