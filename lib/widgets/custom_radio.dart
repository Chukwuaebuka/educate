import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? Colors.white : Colors.white,
        ),
        child: Icon(
          Icons.circle,
          size: 30,
          color: selected ? Colors.greenAccent : Colors.grey.shade800,
        ),
      ),
    );
  }
}
