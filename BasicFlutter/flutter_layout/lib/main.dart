// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_layout/expanded_widget.dart';
import 'package:flutter_layout/workshop_welcome.dart';
// import 'package:flutter_layout/container_widget_layout.dart';
// import 'package:flutter_layout/row_column_widget.dart';
// import 'package:flutter_layout/stack_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkshopWelcome(),
    );
  }
}
