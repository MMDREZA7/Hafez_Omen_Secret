import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  const LoadingWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: LoadingIndicator(
          indicatorType: Indicator.ballBeat,
          colors: [
            color ?? Theme.of(context).indicatorColor,
          ],
        ),
      ),
    );
  }
}
