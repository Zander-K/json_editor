enum JsonKeys {
  title(
    'title',
    'Title',
    '',
    'Enter a modal title',
  ),
  description('description', 'Description', '', 'Enter a modal description'),
  buttonText('buttonText', 'Button Text', '', 'Enter a button text'),
  buttonNavigation('buttonNavigation', 'Button Navigation', null,
      'Select navigation for button'),
  closeButtonNavigation(
    'closeButtonNavigation',
    'Close Button Navigation',
    null,
    'Select navigation for close button (defaults to button navigation)',
  ),
  titleColor('titleColor', 'Title Color', null, 'Select a color for the title'),
  // buttonColor(
  //     'buttonColor', 'Button Color', null, 'Select a color for the button'),
  // modalBackgroundColor('modalBackgroundColor', 'Modal Background Color', null,
  //     'Select a color for the modal background'),
  bodyPadding('bodyPadding', 'Body Padding', null,
      'Select a size for the body padding'),
  buttonPadding('buttonPadding', 'Button Padding', null,
      'Select a size for the button padding'),
  hasError('hasError', 'Has Error', null,
      'Select an option based on if the modal indicates an error/problem'),
  redirectURL(
      'redirectURL', 'Redirect URL', '', 'Enter a URL starting with https://');

  const JsonKeys(
    this.key,
    this.name,
    this.defaultValue,
    this.hintText,
  );

  final String key;
  final String name;
  final dynamic defaultValue;
  final String hintText;
}
