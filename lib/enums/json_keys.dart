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
  headerStyle(
      'headerStyle', 'Header Style', null, 'Select a style for the header'),
  bodyPadding('bodyPadding', 'Body Padding', null,
      'Select a size for the body padding'),
  buttonPadding('buttonPadding', 'Button Padding', null,
      'Select a size for the button padding'),
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
