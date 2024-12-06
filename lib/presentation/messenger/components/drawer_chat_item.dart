import 'package:flutter/material.dart';

class DrawerItemChat extends StatelessWidget {
  final String text;
  final icon;
  final void Function()? onTap;
  final Color? boxColor;

  const DrawerItemChat({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: boxColor,
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
