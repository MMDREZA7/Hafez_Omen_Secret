import 'package:faleh_hafez/application/messaging/bloc/messaging_bloc.dart';
import 'package:faleh_hafez/constants.dart';
import 'package:faleh_hafez/domain/models/massage_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/models/user.dart';
import '../models/chat_message_for_show.dart';

class FileMessage extends StatefulWidget {
  final ChatMessageForShow? message;
  final MessageDTO? messageDto;
  final String token;

  const FileMessage({
    super.key,
    this.message,
    this.messageDto,
    required this.token,
  });

  @override
  State<FileMessage> createState() => _FileMessageState();
}

class _FileMessageState extends State<FileMessage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // context.read<MessagingBloc>().add(
        //       MessagingDownloadFileMessage(
        //         fileID: fileID,
        //         fileName: fileName,
        //         fileSize: fileSize,
        //         fileType: fileType,
        //         token: token,
        //       ),
        //     );
      },
      child: Container(
        width: _size.width * 0.55,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75,
          vertical: kDefaultPadding / 2.5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor.withOpacity(widget.message!.isSender ? 1 : 0.1),
        ),
        child: Row(
          children: [
            BlocProvider(
              create: (context) => MessagingBloc(),
              child: IconButton(
                onPressed: () async {
                  context.read<MessagingBloc>().add(
                        MessagingDownloadFileMessage(
                          fileID:
                              widget.messageDto!.attachFile!.fileAttachmentID!,
                          fileName: widget.messageDto!.attachFile!.fileName!,
                          fileSize: widget.messageDto!.attachFile!.fileSize!,
                          fileType: widget.messageDto!.attachFile!.fileType!,
                          token: widget.token,
                        ),
                      );
                },
                icon: Icon(
                  Icons.file_copy,
                  color:
                      widget.message!.isSender ? Colors.white : kPrimaryColor,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Text(
                  widget.messageDto!.attachFile!.fileName!,
                  style: TextStyle(
                    color:
                        widget.message!.isSender ? Colors.white : Colors.black,
                  ),
                ),
                // child: Stack(
                //   clipBehavior: Clip.none,
                //   alignment: Alignment.center,
                //   children: [
                //     Container(
                //       width: double.infinity,
                //       height: 2,
                //       color: message!.isSender
                //           ? Colors.white
                //           : kPrimaryColor.withOpacity(0.4),
                //     ),
                //     Positioned(
                //       left: 0,
                //       child: Container(
                //         height: 8,
                //         width: 8,
                //         decoration: BoxDecoration(
                //           color: message!.isSender ? Colors.white : kPrimaryColor,
                //           shape: BoxShape.circle,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ),
            ),
            // Text(
            //   "0.37",
            //   style: TextStyle(
            //     fontSize: 12,
            //     color: message!.isSender ? Colors.white : null,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
