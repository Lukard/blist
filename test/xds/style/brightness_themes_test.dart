// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/brightness_themes.dart';
import 'package:blist/xds/style/dark_color_scheme.dart';
import 'package:blist/xds/style/elevated_button_theme.dart';
import 'package:blist/xds/style/light_color_scheme.dart';
import 'package:blist/xds/style/text_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('lightTheme', () {
    test('contains light style associated properties', () {
      // Assigned text theme is always merged with typography
      expect(
        lightTheme.textTheme,
        Typography.material2014(platform: defaultTargetPlatform)
            .black
            .merge(textTheme),
      );
      // Elevated button theme equality is not ensured on MaterialStateProperty
      // properties. Elevation 0 and foreground color will be checked to ensure
      // valid elevated button theme.
      expect(
        lightTheme.elevatedButtonTheme.style!.elevation!
            .resolve(MaterialState.values.toSet()),
        getElevatedButtonTheme(lightColorScheme)
            .style!
            .elevation!
            .resolve(MaterialState.values.toSet()),
      );
      expect(
        lightTheme.elevatedButtonTheme.style!.foregroundColor!
            .resolve(MaterialState.values.toSet()),
        getElevatedButtonTheme(lightColorScheme)
            .style!
            .foregroundColor!
            .resolve(MaterialState.values.toSet()),
      );
      expect(lightTheme.colorScheme, lightColorScheme);
      expect(lightTheme.splashFactory, NoSplash.splashFactory);
      expect(lightTheme.highlightColor, Colors.transparent);
      expect(lightTheme.hoverColor, Colors.transparent);
      expect(lightTheme.focusColor, Colors.transparent);
    });
  });

  group('darkTheme', () {
    test('contains dark style associated properties', () {
      // Assigned text theme is always merged with typography
      expect(
        darkTheme.textTheme,
        Typography.material2014(platform: defaultTargetPlatform)
            .white
            .merge(textTheme),
      );
      // Elevated button theme equality is not ensured on MaterialStateProperty
      // properties. Elevation 0 and foreground color will be checked to ensure
      // valid elevated button theme.
      expect(
        darkTheme.elevatedButtonTheme.style!.elevation!
            .resolve(MaterialState.values.toSet()),
        getElevatedButtonTheme(darkColorScheme)
            .style!
            .elevation!
            .resolve(MaterialState.values.toSet()),
      );
      expect(
        darkTheme.elevatedButtonTheme.style!.foregroundColor!
            .resolve(MaterialState.values.toSet()),
        getElevatedButtonTheme(darkColorScheme)
            .style!
            .foregroundColor!
            .resolve(MaterialState.values.toSet()),
      );
      expect(darkTheme.colorScheme, darkColorScheme);
      expect(darkTheme.splashFactory, NoSplash.splashFactory);
      expect(darkTheme.highlightColor, Colors.transparent);
      expect(darkTheme.hoverColor, Colors.transparent);
      expect(darkTheme.focusColor, Colors.transparent);
    });
  });
}
