import 'package:flutter/material.dart';
import 'package:flutter_mvvm/routers.dart';
import 'package:flutter_mvvm/themes/style.dart';
import 'package:flutter_mvvm/view_model/media_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MediaViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter MVVM',
        theme: appTheme(),
        initialRoute: '/home',
        routes: routes,
      ),
    );
  }
}
