// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_layout/home.dart';

class WorkshopWelcome extends StatefulWidget {
  const WorkshopWelcome({super.key});

  @override
  State<WorkshopWelcome> createState() => _WorkshopWelcomeState();
}

class _WorkshopWelcomeState extends State<WorkshopWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1.0, 1.0),
              colors: [Colors.blue, Colors.teal],
              tileMode: TileMode.repeated),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _textHeader(),
              _welcomeText(),
              _startButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.help, color: Colors.white),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'ช่วยเหลือ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'ภาษาไทย',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _welcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'สวัสดี',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'ยินดีต้อนรับสู่บริการโมบายแบงก์กิ้ง',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ],
    );
  }

  Widget _startButton() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Home()));
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => Home()));
              Navigator.pushNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              padding: EdgeInsets.all(10),
            ),
            child: Text(
              'เริ่มต้นใช้งาน',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}
