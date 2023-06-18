import 'package:flutter/material.dart';

Future<void> createDialog(
    BuildContext context, String title, String content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(title)),
        content: Center(
          heightFactor: 0,
          child: Text(content),
        ),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size.fromHeight(50.0))),
            onPressed: () => {Navigator.pop(context, 'OK')},
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
