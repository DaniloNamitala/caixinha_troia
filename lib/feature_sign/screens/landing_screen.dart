import 'package:caixinha_troia/style/colors.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  LandingState createState() => LandingState();
}

class LandingState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      checkLastSession(false);
    });
  }

  void checkLastSession(bool logged) {
    if (logged) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/login'));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: screenBackgroundColor,
        body: Center(child: CircularProgressIndicator()));
  }
}
