import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines = 1});

  final String hintText;
  final double maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      maxLines: maxLines.toInt(),
      decoration: InputDecoration(
        hintText: hintText,

        border: buildBorder(),
        enabledBorder: buildBorder(Colors.grey),
        focusedBorder: buildBorder(Colors.blue),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white, width: 1.0),
    );
  }
}
