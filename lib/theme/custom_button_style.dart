import 'package:flutter/material.dart';

class CustomButtonStyles {
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
      );

  static get WidgetStateProperty => null;
}
