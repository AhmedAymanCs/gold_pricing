import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
