// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _counter = 0;

  _counterUP() {
    setState(() {
      _counter++;
    });
  }

  _counterDown() {
    if (_counter != 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.home_filled,
        ),
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              print('Take photo');
            },
            icon: Icon(Icons.camera),
          ),
          IconButton(
            onPressed: () {
              print('Notification');
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _counterUP();
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Apps',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  fontFamily: 'Sans',
                  color: Colors.orange[900]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      _counterDown();
                    },
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      _counterUP();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
