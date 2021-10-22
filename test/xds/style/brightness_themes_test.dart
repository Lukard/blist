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
      expect(lightTheme.elevatedButtonTheme, elevatedButtonTheme);
      expect(lightTheme.colorScheme, lightColorScheme);
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
      expect(darkTheme.elevatedButtonTheme, elevatedButtonTheme);
      expect(darkTheme.colorScheme, darkColorScheme);
    });
  });
}
