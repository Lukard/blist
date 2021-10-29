// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/border/padded_stadium_border.dart';
import 'package:blist/xds/style/size.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData getElevatedButtonTheme(ColorScheme colors) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: size.zero,
      shadowColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.pressed)) {
          return colors.onPrimary;
        } else if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        } else {
          return colors.primary;
        }
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => states.contains(MaterialState.pressed)
            ? colors.primary
            : colors.onPrimary,
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          if (states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.selected)) {
            return PaddedStadiumBorder(
              size.zero,
              side: BorderSide(
                color: colors.primary,
                width: size.half,
              ),
            );
          } else if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.focused)) {
            return PaddedStadiumBorder(
              size.one,
              side: BorderSide(
                color: colors.onPrimary,
                width: size.half,
              ),
            );
          } else {
            return const StadiumBorder();
          }
        },
      ),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
    ),
  );
}
