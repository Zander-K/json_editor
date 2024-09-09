import 'package:flutter/material.dart';
import 'package:json_editor_web/constants/ui_constants.dart';
import 'package:json_editor_web/utils/extensions.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.label,
    this.value,
    required this.items,
    this.onChanged,
    this.padding,
    this.hintText,
  });

  final String label;
  final T? value;
  final List<T> items;
  final void Function(T?)? onChanged;
  final EdgeInsetsGeometry? padding;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    var updatedValue = value;
    if (updatedValue.isNull || updatedValue.isEmpty) {
      updatedValue = null;
    }

    return Padding(
      padding: padding ?? UiConst.dropdownPadding,
      child: DropdownButtonFormField<T>(
        value: getValidValues,
        hint: Text(hintText ?? '-'),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
        ),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
      ),
    );
  }

  T? get getValidValues {
    for (var item in items) {
      if (item.runtimeType == String &&
          item.toString().toLowerCase() == value.toString().toLowerCase()) {
        return value;
      }
      if (item.runtimeType == int && item == value) {
        return value;
      }
    }

    return null;
  }
}
