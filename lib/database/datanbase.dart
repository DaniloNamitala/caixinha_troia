import 'package:caixinha_troia/model/user.dart';
import 'package:caixinha_troia/utils/extensions.dart';
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

  Future<bool> routeExists(String route) async {
    DatabaseReference ref = instance.ref(route);
    return (await ref.get()).exists;
  }

  Future<void> insertUser(User user) async {
    DatabaseReference ref = instance.ref("user");
    await ref.child(user.email.clear()).set(user.toMap());
  }

  Future<User?> getUser(String email) async {
    DatabaseReference ref = instance.ref("user");
    var snapshot = await ref.child(email.clear()).get();
    return snapshot.exists
        ? User.fromMap(snapshot.value as Map<Object?, Object?>)
        : null;
  }

  Future<Object?> getAtomic(String route) async {
    DatabaseReference ref = instance.ref(route);
    return (await ref.get()).value;
  }
}
