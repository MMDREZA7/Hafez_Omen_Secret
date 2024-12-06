import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ExitButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            trailing: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            iconColor: Colors.grey[300],
            title: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'vazir',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
