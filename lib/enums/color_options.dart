import 'package:flutter/material.dart';

// New enum for all app colors
enum AppColor {
  primaryGC,
  primaryMB,
  secondaryGC,
  secondaryMB,
  tertiaryGC,
  tertiary,
  successGC,
  successMB,
  warningGC,
  warningMB,
  errorGC,
  errorMB,
  white,
  black,
  ;

  Color get color {
    switch (this) {
      case AppColor.primaryGC:
        return const Color(0xFF00CD70);
      case AppColor.secondaryGC:
        return const Color(0xFFBEBDFF);
      case AppColor.tertiaryGC:
        return const Color(0xFFFF5A00);
      case AppColor.successGC:
        return const Color(0xFF00CD70);
      case AppColor.warningGC:
        return const Color(0xFFFCDC0C);
      case AppColor.errorGC:
        return const Color(0xFFEC6A5D);

      case AppColor.primaryMB:
        return const Color(0xFF6624CF);
      case AppColor.secondaryMB:
        return const Color(0xFF3E4145);
      case AppColor.tertiary:
        return const Color(0xFF9451FF);
      case AppColor.successMB:
        return const Color(0xFF22AB00);
      case AppColor.warningMB:
        return const Color(0xFFEA7000);
      case AppColor.errorMB:
        return const Color(0xFFEA0000);

      case AppColor.white:
        return Colors.white;
      case AppColor.black:
        return Colors.black;
    }
  }
}

// Updated ColorOptions to use AppColor
enum ColorOptions {
  primary(label: 'Primary', grosvenorColor: AppColor.primaryGC, meccaColor: AppColor.primaryMB),
  secondary(label: 'Secondary', grosvenorColor: AppColor.secondaryGC, meccaColor: AppColor.secondaryMB),
  tertiary(label: 'Tertiary', grosvenorColor: AppColor.tertiaryGC, meccaColor: AppColor.tertiary),
  success(label: 'Success', grosvenorColor: AppColor.successGC, meccaColor: AppColor.successMB),
  warning(label: 'Warning', grosvenorColor: AppColor.warningGC, meccaColor: AppColor.warningMB),
  error(label: 'Error', grosvenorColor: AppColor.errorGC, meccaColor: AppColor.errorMB),
  white(label: 'White', grosvenorColor: AppColor.white, meccaColor: AppColor.white),
  black(label: 'Black', grosvenorColor: AppColor.black, meccaColor: AppColor.black),
  ;

  const ColorOptions({required this.label, required this.grosvenorColor, required this.meccaColor});

  final String label;
  final AppColor grosvenorColor;
  final AppColor meccaColor;
}

