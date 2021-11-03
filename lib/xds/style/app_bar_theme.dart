// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

AppBarTheme getAppBarTheme(ColorScheme colors) {
  return AppBarTheme(
    backgroundColor: colors.onPrimary,
    foregroundColor: colors.primary,
    elevation: 0,
  );
}
