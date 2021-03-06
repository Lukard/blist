// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/atom/button.dart';
import 'package:blist/xds/molecule/top_bar.dart';
import 'package:blist/xds/style/brightness_themes.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      theme: lightTheme,
      darkTheme: darkTheme,
      children: [
        Story(
          section: 'Atoms',
          name: 'Button',
          builder: (BuildContext context, KnobsBuilder knobs) {
            return Button(
              onPressed: knobs.boolean(label: 'Enabled') ? () {} : null,
              text: knobs.text(label: 'Text', initial: 'Button'),
            );
          },
        ),
        Story(
          section: 'Molecules',
          name: 'TopBar',
          builder: (BuildContext context, KnobsBuilder knobs) {
            return Scaffold(
              appBar: TopBar(
                title: knobs.text(label: 'Title', initial: 'Title'),
                mainAction: MainAction(
                  knobs.text(label: 'Main Action', initial: 'Action'),
                  knobs.boolean(label: 'Enabled') ? () {} : null,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
