// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

class ContextMenuDemo extends StatelessWidget {
  const ContextMenuDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino context menu'),
      ),
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
