import 'package:flutter/material.dart';

class LabeledCheckbox extends StatefulWidget {
  final String label;
  final Function(bool) onChange;

  const LabeledCheckbox(this.label, {super.key, required this.onChange});

  @override
  State<StatefulWidget> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = value == true;
              });
              widget.onChange(checked);
            }),
        Text(
          widget.label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
