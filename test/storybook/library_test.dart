// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/storybook/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  group('Library', () {
    testWidgets('renders Storybook', (tester) async {
      await tester.pumpWidget(const Library());
      expect(find.byType(Storybook), findsOneWidget);
    });
  });
}
