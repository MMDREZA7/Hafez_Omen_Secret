import 'package:faleh_hafez/application/chat_theme_changer/chat_theme_changer_bloc.dart';
import 'package:faleh_hafez/domain/models/group_chat_dto.dart';
import 'package:faleh_hafez/domain/models/massage_dto.dart';
import 'package:faleh_hafez/domain/models/user.dart';
import 'package:faleh_hafez/domain/models/user_chat_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../application/messaging/bloc/messaging_bloc.dart';
import 'components/ChatPageMessagesView.dart';

class ChatPage extends StatefulWidget {
  final void Function()? onPressedGroupButton;
  final IconData? icon;
  final String hostPublicID, guestPublicID, name;
  final bool isGuest;
  final String chatID;
  final String token;
  final String myID;
  final UserChatItemDTO userChatItemDTO;
  final GroupChatItemDTO groupChatItemDTO;
  final bool isNewChat;
  final MessageDTO message;

  const ChatPage({
    super.key,
    required this.hostPublicID,
    required this.guestPublicID,
    required this.name,
    required this.isGuest,
    required this.chatID,
    required this.token,
    required this.myID,
    required this.userChatItemDTO,
    required this.groupChatItemDTO,
    required this.message,
    this.onPressedGroupButton,
    this.icon,
    this.isNewChat = false,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final box = Hive.box('mybox');
  var userProfile = User(
    id: 'id',
    mobileNumber: 'mobileNumber',
    token: 'token',
    type: UserType.Guest,
  );
  @override
  void initState() {
    super.initState();

    final String id = box.get('userID');
    final String mobileNumber = box.get('userMobile');
    final String token = box.get('userToken');
    // ignore: unused_local_variable
    final String type = box.get('userType');

    // var typeInt = int.tryParse(type);

    var userType = int.parse(type);

    userProfile = User(
      id: id,
      mobileNumber: mobileNumber,
      token: token,
      type: userTypeConvertToEnum[userType]!,
      // type: typeInt[userTypeConvertToEnum],
      // type: typeInt[userTypeConvertToEnum],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (widget.isNewChat) {
          return MessagingBloc();
        } else {
          return MessagingBloc()
            ..add(
              MessagingGetMessages(
                chatID: widget.chatID,
                token: widget.token,
              ),
            );
        }
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: buildAppBar(context),
            body: BlocProvider(
              create: (context) =>
                  ChatThemeChangerBloc()..add(FirstTimeOpenChat()),
              child: ChatPageMessagesListView(
                message: MessageDTO(
                  senderID: widget.message.senderID,
                  text: widget.message.text,
                  chatID: widget.message.chatID,
                  groupID: widget.message.groupID,
                  senderMobileNumber: widget.message.senderMobileNumber,
                  receiverID: widget.message.receiverID,
                  receiverMobileNumber: widget.message.receiverMobileNumber,
                  sentDateTime: widget.message.sentDateTime,
                  isRead: widget.message.isRead,
                  attachFile: widget.message.attachFile,
                ),
                hostPublicID: widget.hostPublicID,
                guestPublicID: widget.guestPublicID,
                isGuest: widget.isGuest,
                myID: widget.myID,
                isNewChat: widget.isNewChat,
                userChatItemDTO: widget.userChatItemDTO,
                token: widget.token,
                groupChatItemDTO: widget.groupChatItemDTO,
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          CupertinoIcons.back,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      title: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 10),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 16),
          ),
          BlocBuilder<MessagingBloc, MessagingState>(
            builder: (context, state) {
              if (state is MessagingLoading) {
                return const Text(
                  'Loading...',
                  style: TextStyle(fontSize: 12),
                );
              } else if (state is MessagingLoaded) {
                return Text(
                  widget.userChatItemDTO.participant2MobileNumber,
                  // widget.userChatItemDTO.participant1MobileNumber,
                  style: const TextStyle(fontSize: 15),
                );
              } else {
                return const Text(
                  '',
                  style: TextStyle(fontSize: 12),
                );
              }
            },
          )
        ],
      ),
      actions: [
        Builder(
          builder: (context) {
            if (widget.onPressedGroupButton != null) {
              return IconButton(
                onPressed: widget.onPressedGroupButton,
                icon: Icon(widget.icon),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            context.read<MessagingBloc>().add(
                  MessagingGetMessages(
                    chatID: widget.chatID,
                    token: widget.token,
                  ),
                );
          },
        ),
      ],
    );
  }
}
