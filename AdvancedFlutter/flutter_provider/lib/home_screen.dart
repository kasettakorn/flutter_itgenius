// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Hello from build widget");
    return Scaffold(
      appBar: AppBar(
        title: Text('${DateTime.now().millisecond}'),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, counter, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => counter.counterDown(),
                child: Text('Counter -'),
              ),
              Text(
                '${counter.getCounter}',
                style: TextStyle(fontSize: 50),
              ),
              ElevatedButton(
                onPressed: () => counter.counterUp(),
                child: Text('Counter +'),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('Next Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
