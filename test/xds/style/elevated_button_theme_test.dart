// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/elevated_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('elevatedButtonTheme', () {
    test('contains xds style', () {
      expect(
        elevatedButtonTheme.style!.shape!.resolve(MaterialState.values.toSet()),
        const StadiumBorder(),
      );
      expect(
        elevatedButtonTheme.style!.elevation!
            .resolve(MaterialState.values.toSet()),
        0,
      );
    });
  });
}
