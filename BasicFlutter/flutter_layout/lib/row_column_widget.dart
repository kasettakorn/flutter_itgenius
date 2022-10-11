// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class RowColumnWidgetLayout extends StatefulWidget {
  const RowColumnWidgetLayout({super.key});

  @override
  State<RowColumnWidgetLayout> createState() => _RowColumnWidgetLayoutState();
}

class _RowColumnWidgetLayoutState extends State<RowColumnWidgetLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row and Column'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.car_rental),
              Icon(Icons.home),
              Icon(Icons.star),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.food_bank),
              Icon(Icons.train_sharp),
              Icon(Icons.air_sharp),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.balance),
              Icon(Icons.gas_meter),
              Icon(Icons.traffic),
            ],
          ),
        ],
      ),
    );
  }
}
