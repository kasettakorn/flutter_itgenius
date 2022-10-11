// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Widget'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text('A'),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Text('B'),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            child: Text('C'),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Text('D'),
          ),
          Positioned(
              top: (MediaQuery.of(context).size.height * 0.4) - 75,
              left: (MediaQuery.of(context).size.width * 0.5) - 75,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.orangeAccent,
              )),
          Positioned(
              top: (MediaQuery.of(context).size.height * 0.4) - 50,
              left: (MediaQuery.of(context).size.width * 0.5) - 50,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              )),
          Positioned(
              top: (MediaQuery.of(context).size.height * 0.4) - 25,
              left: (MediaQuery.of(context).size.width * 0.5) - 25,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}
