import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const Input(this.hint, this.controller, {super.key, this.isPassword = false});

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  var hide = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: hide && widget.isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      hide = !hide;
                    });
                  },
                  icon: Icon(hide ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          labelStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          labelText: widget.hint),
    );
  }
}
