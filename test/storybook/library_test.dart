// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/storybook/library.dart';
import 'package:blist/xds/atom/button.dart';
import 'package:blist/xds/style/brightness_themes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  group('Library', () {
    testWidgets('renders Storybook with light and dark themes', (tester) async {
      await tester.pumpWidget(const Library());
      final storybookFinder = find.byType(Storybook);
      expect(storybookFinder, findsOneWidget);

      final storybook = storybookFinder.evaluate().single.widget as Storybook;
      expect(storybook.darkTheme, darkTheme);
      expect(storybook.theme, lightTheme);
    });

    testWidgets('contains Button component', (tester) async {
      await tester.pumpWidget(const Library());
      await tester.tap(find.text('Button'));
      await tester.pumpAndSettle();
      expect(find.byType(Button), findsOneWidget);
    });
  });
}
