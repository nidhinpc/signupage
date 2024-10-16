import 'package:flutter/material.dart';
import 'package:signupage/view/login_screen/login_screen.dart';
//import 'package:signupage/view/login_screen/login_screen.dart';
import 'package:signupage/view/registration_screen/registration_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
