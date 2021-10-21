import 'package:flutter/material.dart';

final textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(),
      ),
    ),
  ),
);
