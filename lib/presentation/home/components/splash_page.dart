import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[600],
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.green.shade900,
                width: 5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icon/letter-f.png',
                  color: Colors.green.shade900,
                ),
                const SizedBox(height: 50),
                Text(
                  'فال حافظ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.green.shade900,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
