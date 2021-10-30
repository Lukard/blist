// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/dark_color_scheme.dart';
import 'package:blist/xds/style/elevated_button_theme.dart';
import 'package:blist/xds/style/light_color_scheme.dart';
import 'package:blist/xds/style/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = _getThemeDataWithBrightness(Brightness.light);
final ThemeData darkTheme = _getThemeDataWithBrightness(Brightness.dark);

ThemeData _getThemeDataWithBrightness(Brightness brightness) {
  final colorScheme =
      brightness == Brightness.light ? lightColorScheme : darkColorScheme;
  return ThemeData(
    textTheme: textTheme,
    elevatedButtonTheme: getElevatedButtonTheme(colorScheme),
    colorScheme: colorScheme,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
  );
}
