// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('textTheme', () {
    test('contains MerriweatherSans headline 1 values', () {
      expect(textTheme.headline1!.fontFamily, 'MerriweatherSans_300');
      expect(textTheme.headline1!.fontSize, 92);
      expect(textTheme.headline1!.fontWeight, FontWeight.w300);
      expect(textTheme.headline1!.letterSpacing, -1.5);
    });

    test('contains MerriweatherSans headline 2 values', () {
      expect(textTheme.headline2!.fontFamily, 'MerriweatherSans_300');
      expect(textTheme.headline2!.fontSize, 57);
      expect(textTheme.headline2!.fontWeight, FontWeight.w300);
      expect(textTheme.headline2!.letterSpacing, -0.5);
    });

    test('contains MerriweatherSans headline 3 values', () {
      expect(textTheme.headline3!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.headline3!.fontSize, 46);
      expect(textTheme.headline3!.fontWeight, FontWeight.w400);
    });

    test('contains MerriweatherSans headline 4 values', () {
      expect(textTheme.headline4!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.headline4!.fontSize, 32);
      expect(textTheme.headline4!.fontWeight, FontWeight.w400);
      expect(textTheme.headline4!.letterSpacing, 0.25);
    });

    test('contains MerriweatherSans headline 5 values', () {
      expect(textTheme.headline5!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.headline5!.fontSize, 23);
      expect(textTheme.headline5!.fontWeight, FontWeight.w400);
    });

    test('contains MerriweatherSans headline 6 values', () {
      expect(textTheme.headline6!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.headline6!.fontSize, 19);
      expect(textTheme.headline6!.fontWeight, FontWeight.w500);
      expect(textTheme.headline6!.letterSpacing, 0.15);
    });

    test('contains MerriweatherSans subtitle 1 values', () {
      expect(textTheme.subtitle1!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.subtitle1!.fontSize, 15);
      expect(textTheme.subtitle1!.fontWeight, FontWeight.w400);
      expect(textTheme.subtitle1!.letterSpacing, 0.15);
    });

    test('contains MerriweatherSans subtitle 2 values', () {
      expect(textTheme.subtitle2!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.subtitle2!.fontSize, 13);
      expect(textTheme.subtitle2!.fontWeight, FontWeight.w500);
      expect(textTheme.subtitle2!.letterSpacing, 0.1);
    });

    test('contains MerriweatherSans body text 1 values', () {
      expect(textTheme.bodyText1!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.bodyText1!.fontSize, 15);
      expect(textTheme.bodyText1!.fontWeight, FontWeight.w400);
      expect(textTheme.bodyText1!.letterSpacing, 0.5);
    });

    test('contains MerriweatherSans body text 2 values', () {
      expect(textTheme.bodyText2!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.bodyText2!.fontSize, 13);
      expect(textTheme.bodyText2!.fontWeight, FontWeight.w400);
      expect(textTheme.bodyText2!.letterSpacing, 0.25);
    });

    test('contains MerriweatherSans button values', () {
      expect(textTheme.button!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.button!.fontSize, 13);
      expect(textTheme.button!.fontWeight, FontWeight.w500);
      expect(textTheme.button!.letterSpacing, 1.25);
    });

    test('contains MerriweatherSans caption values', () {
      expect(textTheme.caption!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.caption!.fontSize, 11);
      expect(textTheme.caption!.fontWeight, FontWeight.w400);
      expect(textTheme.caption!.letterSpacing, 0.4);
    });

    test('contains MerriweatherSans overline values', () {
      expect(textTheme.overline!.fontFamily, 'MerriweatherSans_regular');
      expect(textTheme.overline!.fontSize, 10);
      expect(textTheme.overline!.fontWeight, FontWeight.w400);
      expect(textTheme.overline!.letterSpacing, 1.5);
    });
  });
}
