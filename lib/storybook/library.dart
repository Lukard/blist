// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/style/text_button_theme.dart';
import 'package:blist/xds/style/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      theme: ThemeData(
        textTheme: textTheme,
        textButtonTheme: textButtonTheme,
      ),
      children: [
        Story(
            name: 'Button',
            builder: (BuildContext context, KnobsBuilder knobs) {
              return TextButton(
                onPressed: knobs.boolean(label: 'Enabled') ? () {} : null,
                child: Text(
                  'Button'.toUpperCase(),
                  style: Theme.of(context).textTheme.button,
                ),
              );
            }),
      ],
    );
  }
}
