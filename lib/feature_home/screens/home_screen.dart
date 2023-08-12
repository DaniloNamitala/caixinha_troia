// ignore_for_file: library_private_types_in_public_api

import 'package:caixinha_troia/database/preferences.dart';
import 'package:caixinha_troia/feature_home/fragments/cart_fragment.dart';
import 'package:caixinha_troia/feature_home/fragments/history_fragment.dart';
import 'package:caixinha_troia/feature_home/widgets/troia_header.dart';
import 'package:caixinha_troia/repository/client_repository.dart';
import 'package:flutter/material.dart';
import 'package:caixinha_troia/style/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreen = 0;
  final _screens = const [CartFragment(), HistoryFragment()];

  void logout() {
    Preferences().removeLogin().then((value) {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: AppBar(
        title: const Text('Troia'),
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          TroiaHeader(ClientRepository().user?.displayName(),
              ClientRepository().user?.email),
          const Spacer(),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              subtitle: const Text("Sair/Trocar de conta"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                logout();
              }),
        ]),
      ),
      body: _screens[currentScreen],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: primaryMaterialColor.shade900,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade600,
          currentIndex: currentScreen,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_rounded), label: 'Carrinho'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_rounded), label: 'Historico')
          ]),
    );
  }

  void onTabTapped(int tab) {
    setState(() {
      currentScreen = tab;
    });
  }
}
