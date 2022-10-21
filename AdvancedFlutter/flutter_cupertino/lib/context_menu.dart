// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: CupertinoContextMenu(
            actions: [
              CupertinoContextMenuAction(
                onPressed: () {},
                trailingIcon: CupertinoIcons.share,
                child: Text('Share'),
              ),
              CupertinoContextMenuAction(
                onPressed: () {},
                trailingIcon: CupertinoIcons.heart,
                child: Text('Favorite'),
              ),
              CupertinoContextMenuAction(
                onPressed: () {},
                trailingIcon: CupertinoIcons.delete,
                isDestructiveAction: true,
                child: Text('Delete'),
              ),
            ],
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemYellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlutterLogo(
                  size: 200,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
