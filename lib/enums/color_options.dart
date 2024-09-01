import 'package:flutter/material.dart';

enum ColorOptions {
  red('Red', Colors.red),
  yellow('Yellow', Colors.yellow),
  green('Green', Colors.green),
  amber('Amber', Colors.amber),
  white('White', Colors.white),
  black('Black', Colors.black);

  const ColorOptions(this.value, this.color);

  final String value;
  final Color color;
}
