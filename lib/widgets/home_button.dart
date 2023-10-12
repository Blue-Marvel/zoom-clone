import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onTap;
  final String placeholder;
  final IconData icon;
  final BoxConstraints constraint;
  const HomeButton(
      {required this.onTap,
      required this.placeholder,
      required this.icon,
      required this.constraint,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: constraint.maxWidth * 0.17,
              height: constraint.maxHeight * 0.7,
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(placeholder),
        ],
      ),
    );
  }
}
