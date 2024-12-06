import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    Key? key,
    this.style,
    required this.message,
  }) : super(key: key);

  final String message;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: style ??
              TextStyle(
                fontSize: _size.height * .03,
                color: Colors.grey,
              ),
        ),
      ),
    );
  }
}
