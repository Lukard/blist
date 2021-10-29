// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

class PaddedStadiumBorder extends OutlinedBorder {
  const PaddedStadiumBorder(this.ringPadding,
      {BorderSide side = BorderSide.none})
      : super(side: side);

  final double ringPadding;

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is PaddedStadiumBorder) {
      return PaddedStadiumBorder(
        ringPadding,
        side: BorderSide.lerp(a.side, side, t),
      );
    } else if (a is StadiumBorder) {
      return PaddedStadiumBorder(
        ringPadding,
        side: BorderSide.lerp(a.side, side, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is PaddedStadiumBorder) {
      return PaddedStadiumBorder(
        ringPadding,
        side: BorderSide.lerp(side, b.side, t),
      );
    } else if (b is StadiumBorder) {
      return PaddedStadiumBorder(
        ringPadding,
        side: BorderSide.lerp(side, b.side, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        final radius = Radius.circular(rect.shortestSide / 2.0);
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, radius)
              .deflate(ringPadding + side.width / 2.0),
          side.toPaint(),
        );
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is PaddedStadiumBorder &&
        other.ringPadding == ringPadding &&
        other.side == side;
  }

  @override
  PaddedStadiumBorder copyWith({BorderSide? side}) {
    return PaddedStadiumBorder(ringPadding, side: side ?? this.side);
  }

  @override
  int get hashCode => hashValues(side, side.hashCode);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final radius = Radius.circular(rect.shortestSide / 2.0);
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, radius)
          .deflate(ringPadding + side.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final radius = Radius.circular(rect.shortestSide / 2.0);
    return Path()..addRRect(RRect.fromRectAndRadius(rect, radius));
  }

  @override
  ShapeBorder scale(double t) {
    return PaddedStadiumBorder(ringPadding, side: side.scale(t));
  }
}
