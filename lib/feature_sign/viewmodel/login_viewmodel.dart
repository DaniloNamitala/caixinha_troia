import 'package:caixinha_troia/feature_sign/repository/sign_repository.dart';
import 'package:caixinha_troia/utils/extensions.dart';
import 'package:caixinha_troia/utils/pair.dart';
import 'package:flutter/material.dart';

class ViewModelLogin {
  final SignRepository repository = SignRepository();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> saveLogin = ValueNotifier(false);
  final ValueNotifier<bool> hidePassword = ValueNotifier(true);
  final ValueNotifier<bool> loading = ValueNotifier(true);
  String? serverPassword;

  void rememberLoginIfNeed() {
    if (serverPassword != null && saveLogin.value) {
      repository.saveLogin(emailController.text.trim(), serverPassword!);
    }
  }

  Future<Pair<bool, String>> loadLogin() async {
    final login = repository.getLogin();
    if (login.first != null && login.second != null) {
      return await checkPassword(login.first!, login.second!);
    }
    return Pair(false, "Não foi possivel carregar o login!");
  }

  Future<Pair<bool, String>> checkPassword(
      String email, String password) async {
    serverPassword = await repository.getPassword(email);

    if (password == serverPassword) {
      return Pair(true, "Login realizado com sucesso.");
    }

    serverPassword = null;
    return Pair(false, "Usuário ou senha incorretos!");
  }

  Future<Pair<bool, String>> login() async {
    loading.value = true;
    final email = emailController.text.trim().toLowerCase();
    final pass = passwordController.text.encrypted();
    return await checkPassword(email, pass);
  }
}
