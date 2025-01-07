import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationDestination(
      icon: Icon(Icons.add),
      label: "ADD",
    );
  }
}