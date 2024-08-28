import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:json_editor_web/constants/ui_constants.dart';

class CustomTextField extends HookWidget {
  final String label;
  final TextEditingController controller;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onChanged;
  final String? hintText;
  final VoidCallback? onTap;
  final String? defaultValue;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.padding,
    this.hintText,
    this.onTap,
    this.defaultValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? UiConst.textFieldPadding,
      child: TextField(
        onTap: onTap,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
