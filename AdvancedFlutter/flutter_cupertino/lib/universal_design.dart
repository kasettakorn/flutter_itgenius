// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class UniversalDesign extends StatelessWidget {
  const UniversalDesign({super.key});

  @override
  Widget build(BuildContext context) {
    // if (UniversalPlatform.isAndroid) {
    //   return materialWidget(context, 'Android');
    // } else if (UniversalPlatform.isIOS) {
    //   cupertinoWidget(context, 'iOS');
    // }
    return UniversalPlatform.isIOS
        ? cupertinoWidget(context, 'iOS')
        : materialWidget(context, 'Android');
  }

  //Material Widget android
  Widget materialWidget(BuildContext context, String message) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            title: Text('Universal Design'),
            centerTitle: true,
            toolbarHeight: 50,
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            message,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  //Cupertino iOS
  Widget cupertinoWidget(BuildContext context, String message) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Universal Design',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: CupertinoColors.white,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            message,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
