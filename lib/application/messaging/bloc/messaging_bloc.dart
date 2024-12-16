import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:faleh_hafez/Service/APIService.dart';
import 'package:faleh_hafez/domain/models/massage_dto.dart';
import 'package:equatable/equatable.dart';
part 'messaging_event.dart';
part 'messaging_state.dart';

class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  late List<MessageDTO?> allMessagesList = [];

  MessagingBloc() : super(MessagingInitial()) {
    on<MessagingGetMessages>(_fetchMessages);
    on<MessagingSendMessage>(_sendMessage);
  }

  FutureOr<void> _fetchMessages(
    MessagingGetMessages event,
    Emitter<MessagingState> emit,
  ) async {
    emit(MessagingLoading());

    try {
      final response = await APIService().getChatMessages(
        chatID: event.chatID,
        token: event.token,
      );

      emit(
        MessagingLoaded(messages: response),
      );
    } catch (e) {
      emit(
        MessagingError(errorMessage: e.toString()),
      );
    }
  }

  FutureOr<void> _sendMessage(
    MessagingSendMessage event,
    Emitter<MessagingState> emit,
  ) async {
    emit(MessagingLoading());

    try {
      var otherID = null;

      if (event.isNewChat) {
        var convertedID = await APIService().getUserID(
          token: event.token,
          mobileNumber: event.mobileNumber,
        );

        otherID = convertedID;
      } else {
        otherID = event.message.reciverID;
      }

      await APIService()
          .sendMessage(
            token: event.token,
            receiverID: otherID,
            text: event.message.text!,
          )
          .then(
            (value) => add(
              MessagingGetMessages(
                chatID: value["chatID"],
                token: event.token,
              ),
            ),
          );
    } catch (e) {
      emit(
        MessagingError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
