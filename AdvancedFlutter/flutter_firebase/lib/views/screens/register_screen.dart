// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';
import 'package:flutter_firebase/views/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {
                final message = await AuthService().register(
                  email: _emailController.text,
                  password: _passwordController.text,
                );

                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );

                

                // print('Email: ${_emailController.text}, Password: ${_passwordController.text}');
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
