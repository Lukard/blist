// Copyright (c) 2021, Rubén Abad Sánchez
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blist/xds/atom/button.dart';
import 'package:flutter/material.dart';

class TopBar extends AppBar {
  TopBar({
    Key? key,
    String title = '',
    MainAction? mainAction,
  }) : super(
          key: key,
          title: Text(title),
          actions: mainAction != null
              ? [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Button(
                      text: mainAction.text,
                      onPressed: mainAction.action,
                    ),
                  )
                ]
              : [],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
            ),
          ),
        );
}

@immutable
class MainAction {
  const MainAction(this.text, this.action);

  final String text;
  final Function()? action;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MainAction && other.text == text && other.action == action;
  }

  @override
  int get hashCode => hashValues(text, action);
}
