// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/border/padded_stadium_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCanvas extends Mock implements Canvas {}

class MockPaint extends Fake implements Paint {}

void main() {
  group('PaddedStadiumBorder lerps', () {
    test('from PaddedStadiumBorder', () {
      const border = PaddedStadiumBorder(
        4,
        side: BorderSide(width: 2, color: Colors.red),
      );
      const otherBorder = PaddedStadiumBorder(
        6,
        side: BorderSide(width: 4, color: Colors.blue),
      );
      final result = border.lerpFrom(otherBorder, 0.5)! as PaddedStadiumBorder;
      expect(result.ringPadding, 4);
      expect(
        result.side,
        BorderSide.lerp(otherBorder.side, border.side, 0.5),
      );
    });

    test('from StadiumBorder', () {
      const border = PaddedStadiumBorder(
        4,
        side: BorderSide(width: 2, color: Colors.red),
      );
      const otherBorder = StadiumBorder(
        side: BorderSide(width: 4, color: Colors.blue),
      );
      final result = border.lerpFrom(otherBorder, 0.5)! as PaddedStadiumBorder;
      expect(result.ringPadding, 4);
      expect(
        result.side,
        BorderSide.lerp(otherBorder.side, border.side, 0.5),
      );
    });

    test('(from) null otherwise', () {
      const border = PaddedStadiumBorder(
        4,
        side: BorderSide(width: 2, color: Colors.red),
      );
      const otherBorder = BeveledRectangleBorder();
      final result = border.lerpFrom(otherBorder, 0.5);
      expect(result, isNull);
    });
  });

  group('PaddedStadiumBorder lerps', () {
    test('to PaddedStadiumBorder', () {
      const border = PaddedStadiumBorder(
        4,
        side: BorderSide(width: 2, color: Colors.red),
      );
      const otherBorder = PaddedStadiumBorder(
        6,
        side: BorderSide(width: 4, color: Colors.blue),
      );
      final result = border.lerpTo(otherBorder, 0.5)! as PaddedStadiumBorder;
      expect(result.ringPadding, 4);
      expect(
        result.side,
        BorderSide.lerp(otherBorder.side, border.side, 0.5),
      );
    });

    test('to StadiumBorder', () {
      const border = PaddedStadiumBorder(
        4,
        side: BorderSide(width: 2, color: Colors.red),
      );
      const otherBorder = StadiumBorder(
        side: BorderSide(width: 4, color: Colors.blue),
      );
      final result = border.lerpTo(otherBorder, 0.5)! as PaddedStadiumBorder;
      expect(result.ringPadding, 4);
      expect(
        result.side,
        BorderSide.lerp(otherBorder.side, border.side, 0.5),
      );
    });

    test('(to) null otherwise', () {
      const border = PaddedStadiumBorder(
        4,
        side: BorderSide(width: 2, color: Colors.red),
      );
      const otherBorder = BeveledRectangleBorder();
      final result = border.lerpTo(otherBorder, 0.5);
      expect(result, isNull);
    });
  });

  group('PaddedStadiumBorder paints', () {
    setUpAll(() {
      registerFallbackValue(MockPaint());
    });

    test('nothing if none border style', () {
      const border = PaddedStadiumBorder(4);
      final canvas = MockCanvas();

      border.paint(canvas, Rect.zero);

      verifyZeroInteractions(canvas);
    });

    test('padded rounded rect if solid border style', () {
      const border = PaddedStadiumBorder(4,
          side: BorderSide(
            color: Colors.red,
            width: 2,
          ));
      final canvas = MockCanvas();
      const rect = Rect.fromLTRB(0, 0, 100, 100);

      border.paint(canvas, rect);

      final resultRadius = Radius.circular(rect.shortestSide / 2.0);
      final resultRect = RRect.fromRectAndRadius(rect, resultRadius).deflate(5);
      final captured =
          verify(() => canvas.drawRRect(resultRect, captureAny())).captured;
      expect((captured.last as Paint).strokeWidth, 2);
      expect((captured.last as Paint).color.value, Colors.red.value);
    });
  });

  group('PaddedStadiumBorder equals', () {
    test('returns false if runtimeTypes are different', () {
      const border = PaddedStadiumBorder(4);
      const otherBorder = StadiumBorder();

      expect(border == otherBorder, isFalse);
    });

    test('returns false if ring paddings are different', () {
      const border = PaddedStadiumBorder(4);
      const otherBorder = PaddedStadiumBorder(2);

      expect(border == otherBorder, isFalse);
    });

    test('returns false if sides are different', () {
      const border = PaddedStadiumBorder(4);
      const otherBorder = PaddedStadiumBorder(4, side: BorderSide());

      expect(border == otherBorder, isFalse);
    });

    test('returns true if ring paddings and sides are equal', () {
      const border = PaddedStadiumBorder(4);
      const otherBorder = PaddedStadiumBorder(4);

      expect(border == otherBorder, isTrue);
    });
  });

  test('PaddedStadiumBorder copies with given border side', () {
    const border = PaddedStadiumBorder(4);
    const side = BorderSide();

    final newBorder = border.copyWith(side: side);

    expect(newBorder.side, side);
  });

  test(
    'PaddedStadiumBorder hashCode is made of ring padding and side values',
    () {
      const side = BorderSide();
      const border = PaddedStadiumBorder(4, side: side);

      expect(border.hashCode, hashValues(4, side.hashCode));
    },
  );

  test('PaddedStadiumBorder dimensions are defined with side width', () {
    const side = BorderSide();
    const border = PaddedStadiumBorder(4, side: side);

    expect(border.dimensions, EdgeInsets.all(side.width));
  });

  test('PaddedStadiumBorder returns inner path', () {
    const rect = Rect.fromLTRB(0, 0, 100, 100);
    const border = PaddedStadiumBorder(4, side: BorderSide());

    final result = border.getInnerPath(rect);
    expect(result.contains(const Offset(5, 5)), isFalse);
    expect(result.contains(const Offset(5, 95)), isFalse);
    expect(result.contains(const Offset(95, 5)), isFalse);
    expect(result.contains(const Offset(95, 95)), isFalse);
    expect(result.contains(const Offset(0, 50)), isFalse);
    expect(result.contains(const Offset(50, 0)), isFalse);
    expect(result.contains(const Offset(5, 50)), isTrue);
    expect(result.contains(const Offset(50, 5)), isTrue);
  });

  test('PaddedStadiumBorder returns outer path', () {
    const rect = Rect.fromLTRB(0, 0, 100, 100);
    const border = PaddedStadiumBorder(4, side: BorderSide());

    final result = border.getOuterPath(rect);
    expect(result.contains(const Offset(5, 5)), isFalse);
    expect(result.contains(const Offset(5, 95)), isFalse);
    expect(result.contains(const Offset(95, 5)), isFalse);
    expect(result.contains(const Offset(95, 95)), isFalse);
    expect(result.contains(const Offset(0, 50)), isTrue);
    expect(result.contains(const Offset(50, 0)), isTrue);
  });

  test('PaddedStadiumBorder scales', () {
    const side = BorderSide();
    const border = PaddedStadiumBorder(4, side: side);

    final newBorder = border.scale(0.5) as PaddedStadiumBorder;

    expect(newBorder.ringPadding, 4);
    expect(newBorder.side, side.scale(0.5));
  });
}
