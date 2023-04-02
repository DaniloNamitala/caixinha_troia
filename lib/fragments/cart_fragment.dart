import 'package:flutter/material.dart';
import 'package:caixinha_troia/widgets/cart_item.dart';

class CartFragment extends StatelessWidget {
  final String texto = 'Carrinho';

  const CartFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          CartItem("Chocolate", 10),
          CartItem("Bala", 11),
          CartItem("Paçoca", 12),
          CartItem("Trento", 13),
        ],
      ),
    );
  }
}
