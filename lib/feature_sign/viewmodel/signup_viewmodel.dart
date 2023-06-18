import 'package:caixinha_troia/feature_sign/repository/sign_repository.dart';
import 'package:caixinha_troia/model/user.dart';
import 'package:caixinha_troia/utils/extensions.dart';
import 'package:caixinha_troia/utils/pair.dart';
import 'package:flutter/material.dart';

class ViewModelSignUp {
  final repository = SignRepository();
  final ValueNotifier<bool> loading = ValueNotifier(false);
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void dispose() {
    loading.value = false;
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
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

  void setLoading(bool enable) {
    loading.value = enable;
  }

  Future<Pair<bool, String>> signUp() async {
    final email = emailController.text.trim().toLowerCase();
    final name = nameController.text.trim();
    final pass = passwordController.text;
    final confrimPass = confirmPasswordController.text;

    final result = validadeData(email, name, pass, confrimPass);

    if (!result.first) {
      return Pair(false, result.second);
    }

    setLoading(true);

    User user = createUser(name, email, pass);
    return repository.registerUser(user);
  }

  User createUser(String name, String email, String pass) {
    return User(name, email, pass.encrypted());
  }
}
