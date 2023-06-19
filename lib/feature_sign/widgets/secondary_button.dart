import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPress;
  final String text;

  const SecondaryButton(this.text, {required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size.fromHeight(50.0))),
        child: Text(text));
  }
}
