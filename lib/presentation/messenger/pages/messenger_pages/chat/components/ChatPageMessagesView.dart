import 'package:faleh_hafez/domain/massage_dto.dart';
import 'package:faleh_hafez/domain/user_chat_dto.dart';

import '../../../../../../application/messaging/bloc/messaging_bloc.dart';
import '../../../../../core/empty_view.dart';
import '../../../../../core/failure_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/chat_message_for_show.dart';
import 'chat_input_field.dart';
import 'chat_page_shimmer_loading.dart';
import 'message.dart';

class ChatPageMessagesListView extends StatelessWidget {
  final String hostPublicID, guestPublicID;
  final bool isGuest;
  final bool isNewChat;
  final String myID;
  final String? image;
  final String token;
  final UserChatItemDTO userChatItemDTO;

  final ScrollController scrollController = ScrollController();

  ChatPageMessagesListView({
    super.key,
    required this.hostPublicID,
    required this.guestPublicID,
    required this.isGuest,
    required this.isNewChat,
    required this.myID,
    required this.userChatItemDTO,
    required this.token,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagingBloc, MessagingState>(
      builder: (context, state) {
        if (state is MessagingInitial) {
          return Column(
            children: [
              const Expanded(
                child: EmptyView(message: 'No Messages Yet'),
              ),
              ChatInputField(
                guestPublicID: guestPublicID,
                hostPublicID: hostPublicID,
                isGuest: isGuest,
                isNewChat: isNewChat,
                userChatItemDTO: userChatItemDTO,
                token: token,
                receiverID: myID == userChatItemDTO.participant1ID
                    ? userChatItemDTO.participant2ID
                    : userChatItemDTO.participant1ID,
                // scrollControllerForMessagesList: scrollController,
              ),
            ],
          );
        }
        if (state is MessagingError) {
          return FailureView(
            message: state.errorMessage.contains("Bad Request")
                ? "درخواست شما قابل اجرا نمی باشد"
                : state.errorMessage,
            onTapTryAgain: () => context.read<MessagingBloc>()
              ..add(
                MessagingGetMessages(
                  chatID: userChatItemDTO.id,
                  token: token,
                ),
              ),
          );
        }
        if (state is MessagingLoadEmpty) {
          return Column(
            children: [
              const Expanded(
                child: EmptyView(message: 'No Messages Yet'),
              ),
              ChatInputField(
                guestPublicID: guestPublicID,
                hostPublicID: hostPublicID,
                isGuest: isGuest,
                isNewChat: isNewChat,
                userChatItemDTO: UserChatItemDTO.empty(),
                token: token,
                receiverID: myID == userChatItemDTO.participant1ID
                    ? userChatItemDTO.participant2ID
                    : userChatItemDTO.participant1ID,
                // scrollControllerForMessagesList: scrollController,
              ),
            ],
          );
        }
        if (state is MessagingLoading) {
          return const ChatsPageShimmerLoading();
        }
        if (state is MessagingLoaded) {
          return _loadSuccessView(
            messages: state.messages,
            isGuest: isGuest,
            hostPublicID: hostPublicID,
            guestPublicID: guestPublicID,
            image: image,
            myID: myID,
            isNewChat: isNewChat,
            userChatItemDTO: userChatItemDTO,
            token: token,
          );
        }
        return const Center(
          child: Text('Some error happened.'),
        );
      },
    );
  }
}

class _loadSuccessView extends StatelessWidget {
  _loadSuccessView({
    Key? key,
    required this.messages,
    required this.isGuest,
    required this.isNewChat,
    required this.hostPublicID,
    required this.guestPublicID,
    // required this.scrollController,
    required this.myID,
    required this.token,
    required this.userChatItemDTO,
    this.image,
  }) : super(key: key);

  final List<MessageDTO?> messages;
  final bool isGuest;
  final bool isNewChat;
  final String hostPublicID;
  final String guestPublicID;
  // final ScrollController scrollController;
  final String? image;
  final String myID;
  final String token;
  final UserChatItemDTO userChatItemDTO;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              // controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) => Message(
                isGuest: messages[index]!.reciverID == myID,
                image: image,
                message: ChatMessageForShow(
                  id: 0,
                  // messages[index]!.id,
                  messageStatus: MessageStatus.viewed,
                  isSender: messages[index]!.senderID == myID,
                  text: messages[index]!.text,
                ),
              ),
            ),
          ),
        ),
        ChatInputField(
          guestPublicID: guestPublicID,
          hostPublicID: hostPublicID,
          isGuest: isGuest,
          isNewChat: isNewChat,
          userChatItemDTO: userChatItemDTO,
          token: token,
          receiverID: myID == userChatItemDTO.participant1ID
              ? userChatItemDTO.participant2ID
              : userChatItemDTO.participant1ID,
          // scrollControllerForMessagesList: scrollController,
        ),
      ],
    );
  }
}
