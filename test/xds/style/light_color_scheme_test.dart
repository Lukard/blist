// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/light_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('lightColorScheme', () {
    test('contains light colors', () {
      expect(lightColorScheme.primary, Colors.black);
      expect(lightColorScheme.primaryVariant, Colors.black);
      expect(lightColorScheme.secondary, Colors.black);
      expect(lightColorScheme.secondaryVariant, Colors.black);
      expect(lightColorScheme.surface, Colors.white);
      expect(lightColorScheme.background, Colors.white);
      expect(lightColorScheme.error, Colors.red);
      expect(lightColorScheme.onPrimary, Colors.white);
      expect(lightColorScheme.onSecondary, Colors.white);
      expect(lightColorScheme.onSurface, Colors.black);
      expect(lightColorScheme.onBackground, Colors.black);
      expect(lightColorScheme.onError, Colors.black);
      expect(lightColorScheme.brightness, Brightness.light);
    });
  });
}
