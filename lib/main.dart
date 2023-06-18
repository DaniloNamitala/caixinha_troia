import 'package:caixinha_troia/database/preferences.dart';
import 'package:caixinha_troia/feature_home/screens/home_screen.dart';
import 'package:caixinha_troia/feature_sign/screens/landing_screen.dart';
import 'package:caixinha_troia/feature_sign/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'style/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Preferences().init();
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
        routes: {
          '/': (context) => const LandingScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen()
        });
  }
}
