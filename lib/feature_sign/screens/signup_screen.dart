import 'package:caixinha_troia/database/datanbase.dart';
import 'package:caixinha_troia/model/user.dart';
import 'package:caixinha_troia/style/colors.dart';
import 'package:caixinha_troia/utils/extensions.dart';
import 'package:caixinha_troia/utils/pair.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  var loading = false;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void setLoading(bool enable) => setState(() {
        loading = enable;
      });

  void handleRegisterResult(Pair<bool, String> result) {
    if (result.first) {
      Navigator.pop(context);
    } else {
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.second),
      ));
    }
  }

  Pair<bool, String> validadeData(
      String email, String name, String pass, String confirmation) {
    if (name.isEmpty) {
      return Pair(false, "Nome não pode ser vazio!!");
    } else if (email.invalidEmail()) {
      return Pair(false, "Email inválido ou não institucional!!");
    } else if (pass != confirmation || pass.isEmpty || confirmation.isEmpty) {
      return Pair(false, "Senhas inválidas ou diferentes!!");
    }
    return Pair(true, "");
  }

  void signUp() {
    final email = emailController.text.trim();
    final name = nameController.text.trim();
    final pass = passwordController.text.trim();
    final confrimPass = confirmPasswordController.text.trim();

    final result = validadeData(email, name, pass, confrimPass);

    if (!result.first) {
      createDialog("ERRO", result.second);
      return;
    }

    setLoading(true);
    User user = User(
        nameController.text, emailController.text, passwordController.text);
    Database()
        .registerUser(user)
        .then((result) => handleRegisterResult(result));
  }

  Future<void> createDialog(String title, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(title)),
          content: Center(
            heightFactor: 0,
            child: Text(content),
          ),
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size.fromHeight(50.0))),
              onPressed: () => {Navigator.pop(context, 'OK')},
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
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
        child: Stack(children: [
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Nome')),
                const Padding(padding: EdgeInsets.all(10.0)),
                TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Email')),
                const Padding(padding: EdgeInsets.all(10.0)),
                TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Senha')),
                const Padding(padding: EdgeInsets.all(10.0)),
                TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Confirmarção da Senha')),
                const Spacer(),
                ElevatedButton(
                  style: const ButtonStyle(
                      minimumSize:
                          MaterialStatePropertyAll(Size.fromHeight(50.0))),
                  onPressed: () => {signUp()},
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
    );
  }
}
