import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<T> items;
  final void Function(T?)? onChanged;
  final EdgeInsetsGeometry padding; // New parameter

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    this.onChanged,
    this.padding =
        const EdgeInsets.symmetric(vertical: 8.0), // Reduced vertical padding
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DropdownButtonFormField<T>(
        value: value,
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
}
