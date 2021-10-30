// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/border/padded_stadium_border.dart';
import 'package:blist/xds/style/elevated_button_theme.dart';
import 'package:blist/xds/style/light_color_scheme.dart';
import 'package:blist/xds/style/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final theme = getElevatedButtonTheme(lightColorScheme);
  final allStates = MaterialState.values.toSet();
  group('elevatedButtonTheme', () {
    test('contains no elevation', () {
      expect(
        theme.style!.elevation!.resolve(allStates),
        size.zero,
      );
    });

    test('contains transparent shadow color', () {
      expect(theme.style!.shadowColor!.resolve(allStates), Colors.transparent);
    });

    test('contains no splash factory', () {
      expect(theme.style!.splashFactory, NoSplash.splashFactory);
    });

    test('contains transparent overlay color', () {
      expect(theme.style!.overlayColor!.resolve(allStates), Colors.transparent);
    });

    test('contains xds background colors', () {
      final defaultStates = MaterialState.values.toList()
        ..remove(MaterialState.pressed)
        ..remove(MaterialState.disabled);
      expect(
        theme.style!.backgroundColor!.resolve({MaterialState.pressed}),
        lightColorScheme.onPrimary,
      );
      expect(
        theme.style!.backgroundColor!.resolve({MaterialState.disabled}),
        Colors.grey,
      );
      expect(
        theme.style!.backgroundColor!.resolve(defaultStates.toSet()),
        lightColorScheme.primary,
      );
    });

    test('contains xds foreground colors', () {
      final defaultStates = MaterialState.values.toList()
        ..remove(MaterialState.pressed);
      expect(
        theme.style!.foregroundColor!.resolve({MaterialState.pressed}),
        lightColorScheme.primary,
      );
      expect(
        theme.style!.foregroundColor!.resolve(defaultStates.toSet()),
        lightColorScheme.onPrimary,
      );
    });

    test('contains proper shape on each material state', () {
      final pressedSelectedShape = theme.style!.shape!
              .resolve({MaterialState.pressed, MaterialState.selected})!
          as PaddedStadiumBorder;
      expect(pressedSelectedShape.ringPadding, size.zero);
      expect(pressedSelectedShape.side.width, size.half);
      expect(pressedSelectedShape.side.color, lightColorScheme.primary);

      final hoveredFocusedShape = theme.style!.shape!
              .resolve({MaterialState.hovered, MaterialState.focused})!
          as PaddedStadiumBorder;
      expect(hoveredFocusedShape.ringPadding, size.one);
      expect(hoveredFocusedShape.side.width, size.half);
      expect(hoveredFocusedShape.side.color, lightColorScheme.onPrimary);

      final defaultMaterialStates = MaterialState.values.toList()
        ..remove(MaterialState.pressed)
        ..remove(MaterialState.selected)
        ..remove(MaterialState.hovered)
        ..remove(MaterialState.focused);
      final defaultShape = theme.style!.shape!
          .resolve(defaultMaterialStates.toSet())! as StadiumBorder;
      expect(defaultShape, const StadiumBorder());
    });
  });
}
