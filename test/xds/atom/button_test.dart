// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:blist/xds/atom/button.dart';
import 'package:blist/xds/style/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('button', () {
    testWidgets('contains text (uppercased if needed)', (tester) async {
      await tester.pumpApp(const Button(text: 'Test'));
      expect(find.text('TEST'), findsOneWidget);
    });

    testWidgets('calls callback when tapped', (tester) async {
      final completer = Completer<void>();
      await tester.pumpApp(Button(onPressed: completer.complete));
      await tester.tap(find.byType(Button));
      expect(completer.isCompleted, true);
    });

    testWidgets('contains ElevatedButton', (tester) async {
      await tester.pumpApp(const Button());
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets(
      'contains text padded [vertical: size.three, horizontal: size.one]',
      (tester) async {
        await tester.pumpApp(const Button(text: 'Test'));

        final elevatedButton = find
            .byType(ElevatedButton)
            .evaluate()
            .first
            .widget as ElevatedButton;

        expect(elevatedButton.child, isA<Padding>());

        final padding = elevatedButton.child! as Padding;

        expect(padding.padding.vertical, size.three * 2);
        expect(padding.padding.horizontal, size.one * 2);
        expect(padding.child, isA<Text>());
      },
    );
  });
}
