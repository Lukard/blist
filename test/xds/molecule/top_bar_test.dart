// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:blist/xds/atom/button.dart';
import 'package:blist/xds/molecule/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('TopBar', () {
    testWidgets('contains specified title', (tester) async {
      await tester.pumpApp(Scaffold(appBar: TopBar(title: 'Test')));
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('contains main action', (tester) async {
      final completer = Completer<void>();
      await tester.pumpApp(Scaffold(
          appBar: TopBar(
        mainAction: MainAction('Action', completer.complete),
      )));
      await tester.tap(find.byType(Button));
      expect(completer.isCompleted, isTrue);
    });

    testWidgets('contains bottom divider', (tester) async {
      await tester.pumpApp(Scaffold(appBar: TopBar()));
      expect(find.byType(Divider), findsOneWidget);
    });
  });
}
