import 'package:flutter/material.dart';
import 'package:json_editor_web/constants/spacing_constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.padding = SpacingConstants.vertical2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
