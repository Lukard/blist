// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/dark_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('darkColorScheme', () {
    test('contains dark colors', () {
      expect(darkColorScheme.primary, Colors.white);
      expect(darkColorScheme.primaryVariant, Colors.white);
      expect(darkColorScheme.secondary, Colors.white);
      expect(darkColorScheme.secondaryVariant, Colors.white);
      expect(darkColorScheme.surface, Colors.black);
      expect(darkColorScheme.background, Colors.black);
      expect(darkColorScheme.error, Colors.red);
      expect(darkColorScheme.onPrimary, Colors.black);
      expect(darkColorScheme.onSecondary, Colors.black);
      expect(darkColorScheme.onSurface, Colors.white);
      expect(darkColorScheme.onBackground, Colors.white);
      expect(darkColorScheme.onError, Colors.white);
      expect(darkColorScheme.brightness, Brightness.dark);
    });
  });
}
