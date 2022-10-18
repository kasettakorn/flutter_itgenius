// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

Widget submitButton(
  String buttonText,
  Function() onPress, {
  Color? color,
  Color? textColor,
}) {
  return SizedBox(
    width: double.infinity,
    height: 40,
    child: ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        // minimumSize: Size(MediaQuery.of(context).size.width - 120, 40),
        backgroundColor: color,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
        ),
      ),
    ),
  );
}

Widget inputFieldWidget(BuildContext context, Icon icon, String hintText,
    Function onValidate, Function onSave,
    {String initialValue = '',
    bool autoFocus = false,
    bool obsecureText = false,
    int maxLength = 30,
    var keyboardType = TextInputType.text,
    var maxLine}) {
  return TextFormField(
    autofocus: autoFocus,
    obscureText: obsecureText,
    initialValue: initialValue,
    keyboardType: keyboardType,
    maxLines: maxLine,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: secondaryText, fontSize: 14),
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      errorStyle: TextStyle(fontSize: 14, color: accent),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary, width: 1),
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: IconTheme(
          data: IconThemeData(
            color: primary,
          ),
          child: icon,
        ),
      ),
    ),
    // maxLength: maxLength,
    validator: (value) {
      return onValidate(value);
    },
    onSaved: (value) {
      // ignore: void_checks
      return onSave(value.toString().trim());
    },
  );
}
