// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/screens/login_screen.dart';
import 'package:flutter_firebase/views/screens/product_screen.dart';
import 'package:flutter_firebase/views/screens/upload_image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //สร้างตัวแปรเก็บข้อมูล authen เช่น email
  String? _userEmail;

  //ฟังก์ชันการดึงข้อมูล authen จาก firebase
  final _auth = FirebaseAuth.instance.currentUser;

  getCurrentUser() async {
    if (_auth != null) {
      setState(() {
        _userEmail = _auth!.email;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $_userEmail'),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
              child: Text('Sign out'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductScreen(),
                ));
              },
              child: Text('Product'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UploadImageScreen(),
                ));
              },
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
