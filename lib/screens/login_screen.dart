import 'package:caixinha_troia/screens/signup_screen.dart';
import 'package:caixinha_troia/style/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackgroundColor,
      body: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
        color: screenBackgroundColor,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Image.asset(
                'assets/images/logo.png',
                scale: 0.7,
              ),
              const Spacer(flex: 1),
              const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Email')),
              const Padding(padding: EdgeInsets.all(10.0)),
              const TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Senha')),
              const Spacer(flex: 4),
              TextButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()))
                      },
                  style: const ButtonStyle(
                      minimumSize:
                          MaterialStatePropertyAll(Size.fromHeight(50.0))),
                  child: const Text("Cadastrar")),
              const Padding(padding: EdgeInsets.all(5.0)),
              ElevatedButton(
                style: const ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size.fromHeight(50.0))),
                onPressed: () => {},
                child: const Text("Entrar"),
              )
            ]),
      ),
    );
  }
}
