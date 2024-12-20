import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:faleh_hafez/Service/APIService.dart';
import 'package:faleh_hafez/domain/models/group_chat_dto%20copy.dart';
import 'package:faleh_hafez/domain/models/user_chat_dto.dart';
import 'package:meta/meta.dart';

part 'chat_items_event.dart';
part 'chat_items_state.dart';

class ChatItemsBloc extends Bloc<ChatItemsEvent, ChatItemsState> {
  ChatItemsBloc() : super(ChatItemsInitial()) {
    on<ChatItemsGetPublicChatsEvent>(_fetchPublicChats);
    on<ChatItemsGetPrivateChatsEvent>(_fetchPrivateChats);
  }

  FutureOr<void> _fetchPrivateChats(
    ChatItemsGetPrivateChatsEvent event,
    Emitter<ChatItemsState> emit,
  ) async {
    emit(ChatItemsLoading());

    try {
      final response = await APIService().getUserChats(token: event.token);

      if (response.isEmpty) {
        emit(ChatItemsEmpty());
        return;
      }

      emit(ChatItemsPrivateChatsLoaded(userChatItems: response));
    } catch (e) {
      emit(
        ChatItemsError(errorMessage: e.toString().split(':')[1]),
      );
    }
  }

  FutureOr<void> _fetchPublicChats(
    ChatItemsGetPublicChatsEvent event,
    Emitter<ChatItemsState> emit,
  ) async {
    emit(ChatItemsLoading());

    try {
      final response = await APIService().getGroupsChat(token: event.token);

      if (response.isEmpty) {
        emit(ChatItemsEmpty());
        return;
      }

      emit(ChatItemsPublicChatsLoaded(groupChatItem: response));
    } catch (e) {
      emit(
        ChatItemsError(
          errorMessage: e.toString().split(':')[1],
        ),
      );
    }
  }
}
