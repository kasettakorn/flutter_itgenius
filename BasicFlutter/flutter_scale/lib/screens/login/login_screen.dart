// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late String _username, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                ),
                Image.asset(
                  'assets/images/page2.png',
                  width: MediaQuery.of(context).size.width - 150,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกชื่อผู้ใช้งาน';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value.toString().trim();
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกรหัสผ่าน';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value.toString();
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      var checkNetwork =
                          await Connectivity().checkConnectivity();

                      if (checkNetwork == ConnectivityResult.none) {
                        AlertDialog alert = AlertDialog(
                          title: Text('เกิดข้อผิดพลาด'),
                          content:
                              Text('อุปกรณ์ของท่านไม่ได้เชื่อมต่ออินเทอร์เน็ต'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ตกลง'),
                            ),
                          ],
                        );

                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => alert);
                      } else {
                        // Call login API
                        var response = await CallAPI().loginAPI(
                            {"username": _username, "password": _password});

                        var body = json.decode(response.body);
                        print(body['code']);
                        if (body['code'] == '200') {
                          //Shared preferences
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();

                          sharedPreferences.setInt('userStep', 1);
                          sharedPreferences.setString(
                              "userID", body['data']['id']);
                          sharedPreferences.setString(
                              "userName", body['data']['username']);
                          sharedPreferences.setString(
                              "fullName", body['data']['fullname']);
                          sharedPreferences.setString(
                              "imgProfile", body['data']['img_profile']);
                          sharedPreferences.setString(
                              "userStatus", body['data']['status']);

                          Navigator.pushReplacementNamed(context, '/dashboard');
                        } else {
                          AlertDialog alert = AlertDialog(
                            title: Text('เกิดข้อผิดพลาด'),
                            content:
                                Text('ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('ตกลง')),
                            ],
                          );

                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => alert);
                        }
                      }
                    } else {
                      AlertDialog alert = AlertDialog(
                        title: Text('เกิดข้อผิดพลาด'),
                        content: Text('กรุณากรอกชื่อผู้ใช้และรหัสผ่าน'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('ตกลง'),
                          ),
                        ],
                      );

                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => alert);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 120, 40),
                    backgroundColor: primary,
                  ),
                  child: Text('เข้าสู่ระบบ'),
                ),
                Row(
                  children: [
                    Text('ยังไม่เป็นสมาชิก ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text('สมัครสมาชิก'),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
