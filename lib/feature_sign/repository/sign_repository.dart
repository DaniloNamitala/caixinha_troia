import 'package:caixinha_troia/database/datanbase.dart';
import 'package:caixinha_troia/database/preferences.dart';
import 'package:caixinha_troia/model/user.dart';
import 'package:caixinha_troia/utils/extensions.dart';
import 'package:caixinha_troia/utils/pair.dart';

class SignRepository {
  final Database _database = Database();
  final Preferences _preferences = Preferences();

  Future<Pair<bool, String>> registerUser(User user) async {
    var u = await _database.getUser(user.email);
    if (u == null) {
      await _database.insertUser(user);
      return Pair(true, "Usuário cadastrado com sucesso!!");
    }
    return Pair(false, "Email já cadastrado!!");
  }

  Future<User?> getUser(String email) => _database.getUser(email);

  Future<String?> getPassword(String email) async {
    final result = await _database.getAtomic("user/${email.clear()}/password");
    return result as String?;
  }

  void saveLogin(String email, String password) =>
      _preferences.saveLogin(email, password);

  Pair<String?, String?> getLogin() => _preferences.getLogin();
}
