// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ContainerWidgetLayout extends StatefulWidget {
  const ContainerWidgetLayout({super.key});

  @override
  State<ContainerWidgetLayout> createState() => _ContainerWidgetLayoutState();
}

class _ContainerWidgetLayoutState extends State<ContainerWidgetLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Layout'),
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.orange,
            border: Border.all(width: 5, color: Colors.brown),
            // borderRadius: BorderRadius.circular(15),
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                  'https://www.projectorworld.co.th/wp-content/uploads/2022/01/278-2783353_mobile-mobile-phone-icon-red-png.jpg',
                ),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(blurRadius: 10, blurStyle: BlurStyle.outer),
            ],
          ),

          // child: Text('content'),
        ),
      ),
    );
  }
}
