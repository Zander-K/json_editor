import 'package:flutter/material.dart';

enum ColorOptions {
  primary('Primary', Colors.blue),
  secondary('Secondary', Colors.purple),
  tertiary('Tertiary', Colors.teal),
  success('Success', Colors.greenAccent),
  warning('Warning', Colors.orange),
  error('Error', Colors.redAccent),
  white('White', Colors.white),
  black('Black', Colors.black),
  ;

  const ColorOptions(this.value, this.color);

  final String value;
  final Color color;
}

