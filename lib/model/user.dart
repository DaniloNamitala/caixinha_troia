import 'package:caixinha_troia/model/cart.dart';

class User {
  late String name;
  late String password;
  late String email;
  late Cart cart;

  User(this.name, this.email, this.password) {
    cart = Cart();
  }

  User.fromMap(Map<Object?, Object?> map) {
    name = map['name'] as String;
    password = map['password'] as String;
    email = map['email'] as String;
    cart = Cart();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'cart': cart.toMap()
    };
  }
}
