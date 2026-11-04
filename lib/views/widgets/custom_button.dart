import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          'Add Note',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
