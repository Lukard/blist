// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/app_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppBarTheme', () {
    final colorScheme = ColorScheme.fromSwatch();
    final appBarTheme = getAppBarTheme(colorScheme);
    test('contains onPrimary background color', () {
      expect(appBarTheme.backgroundColor, colorScheme.onPrimary);
    });

    test('contains primary foreground color', () {
      expect(appBarTheme.foregroundColor, colorScheme.primary);
    });

    test('contains no elevation', () {
      expect(appBarTheme.elevation, 0);
    });
  });
}
