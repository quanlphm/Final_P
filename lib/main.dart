import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/CartPage.dart';
import 'package:flutter_application_1/pages/Homepage.dart';
import 'package:flutter_application_1/pages/ItemPage.dart';
import 'package:flutter_application_1/pages/UserPage.dart';
import 'package:flutter_application_1/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
      //routes: {
      // "/": (context) => HomePage(),
      // "/cartPage": (context) => CartPage(),
      //  "/itemPage": (context) => ItemPage(),
      //"/login_screen": (context) => LoginScreen(),
      //},
    );
  }
}
