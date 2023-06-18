import 'package:caixinha_troia/feature_sign/screens/signup_screen.dart';
import 'package:caixinha_troia/feature_sign/viewmodel/login_viewmodel.dart';
import 'package:caixinha_troia/style/colors.dart';
import 'package:caixinha_troia/utils/dialog.dart';
import 'package:caixinha_troia/utils/pair.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ViewModelLogin viewModel = ViewModelLogin();

  void handleLoginResult(Pair<bool, String> result) {
    if (result.first) {
      viewModel.loading.value = false;
      viewModel.rememberLoginIfNeed();
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      createDialog(context, "ERRO", result.second);
    }
  }

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
              TextField(
                  controller: viewModel.emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Email')),
              const Padding(padding: EdgeInsets.all(10.0)),
              ListenableBuilder(
                listenable: viewModel.hidePassword,
                builder: (context, widget) => TextField(
                    obscureText: viewModel.hidePassword.value,
                    controller: viewModel.passwordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Senha',
                        suffixIcon: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            viewModel.hidePassword.value =
                                !viewModel.hidePassword.value;
                          },
                          icon: Icon(viewModel.hidePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ))),
              ),
              Row(
                children: [
                  ListenableBuilder(
                      listenable: viewModel.saveLogin,
                      builder: (context, child) => Checkbox(
                          value: viewModel.saveLogin.value,
                          onChanged: (value) {
                            viewModel.saveLogin.value = value == true;
                          })),
                  const Text(
                    "Me mantenha conectado",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
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
                onPressed: () {
                  viewModel.login().then((value) => handleLoginResult(value));
                },
                child: const Text("Entrar"),
              )
            ]),
      ),
    );
  }
}
