// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({super.key});

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expanded Widget'),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              color: Colors.green,
            ),
            Expanded(
              flex: 9,
              child: Container(
                color: Colors.yellow[300],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue[300],
              ),
            ),
          ],
        ));
  }
}
