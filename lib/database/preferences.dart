import 'package:caixinha_troia/utils/pair.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const _emailKey = "login/email";
  static const _passwordkey = "login/password";

  static final Preferences _instance = Preferences._internal();
  late final SharedPreferences preference;

  Preferences._internal();

  factory Preferences() => _instance;

  Future<void> init() async {
    preference = await SharedPreferences.getInstance();
  }

  void saveLogin(String email, String password) async {
    await preference.setString(_emailKey, email);
    await preference.setString(_passwordkey, password);
  }

  Future<void> removeLogin() async {
    await preference.remove(_emailKey);
    await preference.remove(_passwordkey);
  }

  Pair<String?, String?> getLogin() {
    final email = preference.getString(_emailKey);
    final password = preference.getString(_passwordkey);
    return Pair(email, password);
  }
}
