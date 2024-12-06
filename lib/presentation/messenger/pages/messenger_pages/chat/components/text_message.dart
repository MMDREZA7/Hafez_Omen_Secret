import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../models/chat_message_for_show.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessageForShow? message;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      // color: MediaQuery.of(context).platformBrightness == Brightness.dark
      //     ? Colors.white
      //     : Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(message!.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        color: Colors.transparent,
        width: _size.width * .3,
        child: Center(
          child: Text(
            message!.text,
            // style: TextStyle(
            //   color: message!.isSender
            //       ? Colors.white
            //       : Theme.of(context).textTheme.bodyText1!.color,
            // ),
          ),
        ),
      ),
      // child: Text(
      //   message!.text,
      //   style: TextStyle(
      //     color: message!.isSender
      //         ? Colors.white
      //         : Theme.of(context).textTheme.bodyText1!.color,
      //   ),
      // ),
    );
  }
}
