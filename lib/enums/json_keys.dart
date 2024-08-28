enum JsonKeys {
  title('title', 'Title', ''),
  description('description', 'Description', ''),
  buttonText('buttonText', 'Button Text', ''),
  buttonNavigation('buttonNavigation', 'Button Navigation', null),
  closeButtonNavigation(
      'closeButtonNavigation', 'Close Button Navigation', null),
  titleColor('titleColor', 'Title Color', ''),
  buttonColor('buttonColor', 'Button Color', ''),
  modalBackgroundColor('modalBackgroundColor', 'Modal Background Color', ''),
  bodyPadding('bodyPadding', 'Body Padding', null),
  buttonPadding('buttonPadding', 'Button Padding', null),
  isError('isError', 'Is Error', null),
  redirectURL('redirectURL', 'Redirect URL', '');

  const JsonKeys(this.key, this.name, this.defaultValue);

  final String key;
  final String name;
  final dynamic defaultValue;
}
