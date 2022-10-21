// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino/context_menu.dart';

void main() {
  return (runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: ContextMenuDemo(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text('Settings'),
        message: Text('Please select settings option'),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Default Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Notification'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDestructiveAction: true,
            child: Text('Sign out'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Erased iPhone'),
        content: Text(
            'Are you sure to erased iPhone? \n This action cannot be undone.'),
        actions: [
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text('Erase'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.home,
            size: 24, color: CupertinoColors.activeBlue),
        middle: Text('Home'),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                print('click');
              },
              child: Icon(CupertinoIcons.add,
                  size: 24, color: CupertinoColors.activeBlue),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                print('click');
              },
              child: Icon(CupertinoIcons.location,
                  size: 24, color: CupertinoColors.activeBlue),
            ),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: null,
              child: Text('Cancel order'),
            ),
            CupertinoButton.filled(
              onPressed: null,
              disabledColor: Colors.grey.shade400,
              child: Text('Cancel order'),
            ),
            CupertinoButton(
              child: Text('Show action sheet'),
              onPressed: () => _showActionSheet(context),
            ),
            CupertinoButton.filled(
              child: Text('Show alert dialog'),
              onPressed: () => _showAlertDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
