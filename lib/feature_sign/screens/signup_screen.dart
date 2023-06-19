import 'package:caixinha_troia/feature_sign/viewmodel/signup_viewmodel.dart';
import 'package:caixinha_troia/widgets/input.dart';
import 'package:caixinha_troia/style/colors.dart';
import 'package:caixinha_troia/utils/dialog.dart';
import 'package:caixinha_troia/utils/extensions.dart';
import 'package:caixinha_troia/utils/pair.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final ViewModelSignUp viewModel = ViewModelSignUp();

  void handleRegisterResult(Pair<bool, String> result) {
    if (result.first) {
      Navigator.pop(context);
    } else {
      viewModel.setLoading(false);
      createDialog(context, "ERRO", result.second);
    }
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      backgroundColor: screenBackgroundColor,
      body: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
        color: screenBackgroundColor,
        child: viewModel.loading.listen(
          (loading) => Stack(children: [
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Input("Nome", viewModel.nameController),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Input("Email", viewModel.emailController),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Input(
                    "Senha",
                    viewModel.passwordController,
                    isPassword: true,
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Input(
                    "Confirmação da Senha",
                    viewModel.confirmPasswordController,
                    isPassword: true,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: const ButtonStyle(
                        minimumSize:
                            MaterialStatePropertyAll(Size.fromHeight(50.0))),
                    onPressed: () {
                      viewModel
                          .signUp()
                          .then((result) => handleRegisterResult(result));
                    },
                    child: const Text("Cadastrar"),
                  )
                ]),
            if (loading)
              const Opacity(
                  opacity: 0.0,
                  child: ModalBarrier(dismissible: false, color: Colors.black)),
            if (loading) const Center(child: CircularProgressIndicator()),
          ]),
        ),
      ),
    );
  }
}
