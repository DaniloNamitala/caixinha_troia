import 'package:caixinha_troia/feature_sign/screens/signup_screen.dart';
import 'package:caixinha_troia/feature_sign/viewmodel/login_viewmodel.dart';
import 'package:caixinha_troia/feature_sign/widgets/primary_button.dart';
import 'package:caixinha_troia/feature_sign/widgets/secondary_button.dart';
import 'package:caixinha_troia/widgets/input.dart';
import 'package:caixinha_troia/feature_sign/widgets/labeled_checkbox.dart';
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
              Input("Email", viewModel.emailController),
              const Padding(padding: EdgeInsets.all(10.0)),
              Input(
                "Senha",
                viewModel.passwordController,
                isPassword: true,
              ),
              LabeledCheckbox(
                "Mantenha-me Conecato",
                onChange: (value) {
                  viewModel.saveLogin = value;
                },
              ),
              const Spacer(flex: 4),
              SecondaryButton("Cadastrar",
                  onPress: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()))
                      }),
              const Padding(padding: EdgeInsets.all(5.0)),
              PrimaryButton("Entrar", onPress: () {
                viewModel.login().then((value) => handleLoginResult(value));
              })
            ]),
      ),
    );
  }
}
