import 'package:flutter/material.dart';
import 'package:json_editor_web/constants/ui_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlTestingTextField extends StatefulWidget {
  const UrlTestingTextField({
    super.key,
    required this.label,
    required this.controller,
    this.padding,
    this.onChanged,
    this.hintText,
  });

  final String label;
  final TextEditingController controller;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onChanged;
  final String? hintText;

  @override
  _UrlTestingTextFieldState createState() => _UrlTestingTextFieldState();
}

class _UrlTestingTextFieldState extends State<UrlTestingTextField> {
  String? _redirectURL;
  bool _isURLValid = false;

  final _urlRegex = RegExp(
    r'^(https?:\/\/)?(([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,})(\/[^\s]*)?$',
    caseSensitive: false,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? UiConst.urlTestingTextFieldPadding,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.link,
              color: _isURLValid ? Colors.green : Colors.grey,
            ),
            onPressed: _isURLValid ? _testRedirectURL : null,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _redirectURL = value;
            _isURLValid = _urlRegex.hasMatch(value);
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          });
        },
      ),
    );
  }

  void _testRedirectURL() async {
    if (_isURLValid && _redirectURL != null) {
      final url = Uri.parse(_redirectURL!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch the URL')),
        );
      }
    }
  }
}
