// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

const size = Size(
  zero: 0,
  half: 2,
  one: 4,
  two: 8,
  three: 12,
);

class Size {
  const Size({
    required this.zero,
    required this.half,
    required this.one,
    required this.two,
    required this.three,
  });

  final double zero;
  final double half;
  final double one;
  final double two;
  final double three;
}
