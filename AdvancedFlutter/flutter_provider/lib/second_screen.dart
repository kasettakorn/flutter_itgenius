// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Hello second screen');
    return Consumer<CounterProvider>(
      builder: (context, counter, child) => Scaffold(
        appBar: AppBar(
          title: Text('Second ${DateTime.now().millisecond}'),
          actions: [
            IconButton(
                onPressed: () {
                  counter.counterUp();
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: '),
              Text('${counter.getCounter}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to home screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
