import 'package:caixinha_troia/feature_sign/viewmodel/signup_viewmodel.dart';
import 'package:caixinha_troia/style/colors.dart';
import 'package:caixinha_troia/utils/dialog.dart';
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
        child: ListenableBuilder(
          listenable: viewModel.loading,
          builder: (context, child) => Stack(children: [
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: viewModel.nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Nome')),
                  const Padding(padding: EdgeInsets.all(10.0)),
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
                            controller: viewModel.passwordController,
                            obscureText: viewModel.hidePassword.value,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    viewModel.hidePassword.value =
                                        !viewModel.hidePassword.value;
                                  },
                                  icon: Icon(viewModel.hidePassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: 'Senha'),
                          )),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  ListenableBuilder(
                      listenable: viewModel.hideConfirmation,
                      builder: (context, widget) => TextField(
                          controller: viewModel.confirmPasswordController,
                          obscureText: viewModel.hideConfirmation.value,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  viewModel.hideConfirmation.value =
                                      !viewModel.hideConfirmation.value;
                                },
                                icon: Icon(viewModel.hideConfirmation.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              labelStyle: const TextStyle(color: Colors.white),
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Confirmarção da Senha'))),
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
            if (viewModel.loading.value)
              const Opacity(
                  opacity: 0.0,
                  child: ModalBarrier(dismissible: false, color: Colors.black)),
            if (viewModel.loading.value)
              const Center(child: CircularProgressIndicator()),
          ]),
        ),
      ),
    );
  }
}
