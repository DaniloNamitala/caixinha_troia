import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPress;
  final String text;

  const PrimaryButton(this.text, {required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size.fromHeight(50.0))),
      onPressed: onPress,
      child: Text(text),
    );
  }
}
