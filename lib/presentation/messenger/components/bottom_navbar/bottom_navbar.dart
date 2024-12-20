import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndexPage,
      onDestinationSelected: (int index) {
        setState(() {
          currentIndexPage = index;
        });
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.add),
          label: "ADD",
        ),
        NavigationDestination(
          icon: Icon(Icons.remove),
          label: "REMOVE",
        ),
        NavigationDestination(
          icon: Icon(Icons.phone),
          label: "PHONE",
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          label: "HOME",
        ),
      ],
    );
  }
}
