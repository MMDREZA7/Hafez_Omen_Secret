import 'package:faleh_hafez/application/chat_theme_changer/chat_theme_changer_bloc.dart';
import 'package:faleh_hafez/domain/models/group_chat_dto.dart';
import 'package:faleh_hafez/domain/models/massage_dto.dart';
import 'package:faleh_hafez/domain/models/user_chat_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/messaging/bloc/messaging_bloc.dart';
import 'components/ChatPageMessagesView.dart';

class ChatPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (isNewChat) {
          return MessagingBloc();
        } else {
          return MessagingBloc()
            ..add(
              MessagingGetMessages(
                chatID: chatID,
                token: token,
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
                message: message,
                hostPublicID: hostPublicID,
                guestPublicID: guestPublicID,
                isGuest: isGuest,
                myID: myID,
                isNewChat: isNewChat,
                userChatItemDTO: userChatItemDTO,
                token: token,
                groupChatItemDTO: groupChatItemDTO,
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
            name,
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
                  userChatItemDTO.participant1MobileNumber,
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
            if (onPressedGroupButton != null) {
              return IconButton(
                onPressed: onPressedGroupButton,
                icon: Icon(icon),
              );
            } else {
              return SizedBox();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            context.read<MessagingBloc>().add(
                  MessagingGetMessages(
                    chatID: chatID,
                    token: token,
                  ),
                );
          },
        ),
      ],
    );
  }
}
