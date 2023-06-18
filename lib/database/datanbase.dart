import 'package:caixinha_troia/model/user.dart';
import 'package:caixinha_troia/utils/extensions.dart';
import 'package:caixinha_troia/utils/pair.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  static final Database _instace = Database._internal();
  late final FirebaseDatabase instance;

  factory Database() {
    return _instace;
  }

  Database._internal() {
    instance = FirebaseDatabase.instance;
  }

  Future<Pair<bool, String>> registerUser(User user) async {
    var u = await getUser(user.email);
    if (u == null) {
      await insertUser(user);
      return Pair(true, "Usuário cadastrado com sucesso!!");
    }
    return Pair(false, "Email já cadastrado!!");
  }

  Future<void> insertUser(User user) async {
    DatabaseReference ref = instance.ref("user");
    await ref.child(user.email.removeInvalidChars()).set(user.toMap());
  }

  Future<User?> getUser(String email) async {
    DatabaseReference ref = instance.ref("user");
    var snapshot = await ref.child(email.removeInvalidChars()).get();
    return snapshot.exists
        ? User.fromMap(snapshot.value as Map<Object?, Object?>)
        : null;
  }
}
