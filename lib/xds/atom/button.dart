// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.onPressed,
    this.text = '',
  }) : super(key: key);

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Text(
          text.toUpperCase(),
        ),
      ),
    );
  }
}
