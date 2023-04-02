import 'package:caixinha_troia/screens/home_screen.dart';
import 'package:caixinha_troia/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Caixinha TROIA',
        theme: ThemeData(
          primarySwatch: primaryMaterialColor,
        ),
        home: const LoginScreen() //HomeScreen()
        );
  }
}
