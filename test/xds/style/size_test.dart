// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/size.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('size', () {
    test('contains xds sizing units', () {
      expect(size.zero, 0);
      expect(size.half, 2);
      expect(size.one, 4);
      expect(size.two, 8);
      expect(size.three, 12);
    });
  });
}
