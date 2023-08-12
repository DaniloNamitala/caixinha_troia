import 'package:caixinha_troia/model/user.dart';

class ClientRepository {
  static final ClientRepository _instance = ClientRepository._internal();
  User? user;

  ClientRepository._internal();

  factory ClientRepository() {
    return _instance;
  }

  void setUser(User? user) {
    this.user = user;
  }
}
