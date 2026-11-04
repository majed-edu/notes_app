import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
  });

  final String hintText;
  final double maxLines;

  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) =>
          value == null || value.isEmpty ? 'This field is required' : null,
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
