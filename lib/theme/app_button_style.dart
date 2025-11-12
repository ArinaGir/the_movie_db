import 'package:flutter/material.dart';

abstract final class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: WidgetStateProperty.all(
      const Color.fromRGBO(1, 180, 228, 1),
    ),
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(
          Radius.circular(6),
        ),
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
