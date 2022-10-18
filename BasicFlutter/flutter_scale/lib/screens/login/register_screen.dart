// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/utils/utility.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late String _fullname, _username, _password;

  submitRegister() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (await Utility.getInstance()!.checkNetworkConnection() == '') {
        Utility.getInstance()!.showAlertDialog(
            context, 'เกิดข้อผิดพลาด', 'ไม่พบการเชื่อมต่อเครือข่าย');
      } else {
        var response = await CallAPI().registerAPI({
          "username": _username,
          "password": _password,
          "fullname": _fullname,
          "status": "1"
        });

        log('data: $response');
        var body = json.decode(response.body);
        if (body['status'] == 'success') {
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          Utility.getInstance()!.showAlertDialog(context, 'เกิดข้อผิดพลาด',
              'ไม่สามารถลงทะเบียนได้ กรุณาลองอีกครั้ง');
        }
      }

      // var checkNetwork = await Connectivity().checkConnectivity();

      // if (checkNetwork == ConnectivityResult.none) {

      // } else {
      //   // Call login API
      //   var response = await CallAPI()
      //       .loginAPI({"username": _username, "password": _password});

      //   var body = json.decode(response.body);

      //   if (body['code'] == '200') {
      //     //Shared preferences
      //     SharedPreferences sharedPreferences =
      //         await SharedPreferences.getInstance();

      //     sharedPreferences.setInt('userStep', 1);
      //     sharedPreferences.setString("userID", body['data']['id']);
      //     sharedPreferences.setString("userName", body['data']['username']);
      //     sharedPreferences.setString("fullName", body['data']['fullname']);
      //     sharedPreferences.setString(
      //         "imgProfile", body['data']['img_profile']);
      //     sharedPreferences.setString("userStatus", body['data']['status']);

      //     Navigator.pushReplacementNamed(context, '/dashboard');
      //   } else {
      //     AlertDialog alert = AlertDialog(
      //       title: Text('เกิดข้อผิดพลาด'),
      //       content: Text('ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง'),
      //       actions: [
      //         TextButton(
      //             onPressed: () => Navigator.pop(context), child: Text('ตกลง')),
      //       ],
      //     );

      //     showDialog(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (BuildContext context) => alert);
      //   }
      // }
    } else {
      Utility.getInstance()!.showAlertDialog(
          context, 'เกิดข้อผิดพลาด', 'กรุณากรอกข้อมูลให้ครบถ้วน');
    }
  }

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
                  child: inputFieldWidget(
                      context, Icon(Icons.person), 'ชื่อ-นามสกุล',
                      (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาป้อนชื่อ-นามสกุล';
                    } else {
                      return null;
                    }
                  }, (onSaveValue) {
                    _fullname = onSaveValue;
                  }),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: inputFieldWidget(
                      context, Icon(Icons.person), 'ชื่อผู้ใช้',
                      (onValidateValue) {
                    if (onValidateValue!.isEmpty) {
                      return 'กรุณาป้อนชื่อผู้ใช้';
                    } else {
                      return null;
                    }
                  }, (onSaveValue) {
                    _username = onSaveValue;
                  }),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: inputFieldWidget(
                    context,
                    Icon(Icons.password),
                    'รหัสผ่าน',
                    (onValidateValue) {
                      if (onValidateValue!.isEmpty) {
                        return 'กรุณาป้อนรหัสผ่าน';
                      } else {
                        return null;
                      }
                    },
                    (onSaveValue) {
                      _password = onSaveValue;
                    },
                    obsecureText: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: submitButton(
                    'ลงทะเบียน',
                    submitRegister,
                    color: Colors.red[400],
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('เป็นสมาชิกแล้ว ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('เข้าสู่ระบบ'),
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
