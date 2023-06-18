// ignore_for_file: must_be_immutable

import 'package:caixinha_troia/style/colors.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String title;
  int quantity;

  CartItem(this.title, this.quantity, {super.key});

  @override
  State<StatefulWidget> createState() {
    return CartItemState();
  }
}

class CartItemState extends State<CartItem> {
  void increment(int inc) {
    setState(() {
      widget.quantity += inc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.info_outline, color: Colors.white)),
          Text(
            widget.title.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
          IconButton(
              onPressed: () => {increment(-1)},
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              )),
          Text('${widget.quantity}',
              style: const TextStyle(color: Colors.white)),
          IconButton(
              onPressed: () => {increment(1)},
              icon: const Icon(Icons.add, color: Colors.white))
        ],
      ),
    );
  }
}
