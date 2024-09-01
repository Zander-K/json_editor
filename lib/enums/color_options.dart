import 'package:flutter/material.dart';

enum ColorOptions {
  red('red', Colors.red),
  yellow('yellow', Colors.yellow),
  green('green', Colors.green),
  amber('amber', Colors.amber),
  white('white', Colors.white),
  black('black', Colors.black);

  const ColorOptions(this.value, this.color);

  final String value;
  final Color color;
}
