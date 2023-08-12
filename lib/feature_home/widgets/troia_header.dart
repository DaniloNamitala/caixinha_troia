import 'package:caixinha_troia/utils/extensions.dart';
import 'package:flutter/material.dart';

class TroiaHeader extends StatelessWidget {
  final String? name;
  final String? email;

  const TroiaHeader(this.name, this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          name?.initials() ?? "UK",
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
      accountName: Text(name ?? "null"),
      accountEmail: Text(email ?? "null"),
    );
  }
}
