import 'package:caixinha_troia/model/cart.dart';
import 'package:caixinha_troia/types/roles.dart';

class User {
  late String name;
  late String password;
  late String email;
  late Cart cart;
  Roles role = Roles.user;

  User(this.name, this.email, this.password) {
    cart = Cart();
  }

  User.fromMap(Map<Object?, Object?> map) {
    name = map['name'] as String;
    password = map['password'] as String;
    email = map['email'] as String;
    cart = Cart();
    role = Roles.fromInt(map['role'] as int);
  }

  String displayName() {
    if (role.toInt() > 1) {
      return "$name (${role.toString().split(".")[1].toUpperCase()})";
    }
    return name;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'role': role.toInt(),
      'cart': cart.toMap()
    };
  }
}
