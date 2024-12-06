import 'package:bloc/bloc.dart';
import 'package:omen/Service/APIService.dart';
import 'package:omen/domain/user_chat_dto.dart';
import 'package:meta/meta.dart';

part 'chat_items_event.dart';
part 'chat_items_state.dart';

class ChatItemsBloc extends Bloc<ChatItemsEvent, ChatItemsState> {
  ChatItemsBloc() : super(ChatItemsInitial()) {
    on<ChatItemsGetItemsEvent>((event, emit) async {
      emit(ChatItemsLoading());

      try {
        final response = await APIService().getUserChats(token: event.token);

        if (response.isEmpty) {
          emit(ChatItemsEmpty());
          return;
        }

        emit(ChatItemsLoaded(userChatItems: response));
      } catch (e) {
        emit(
          ChatItemsError(errorMessage: e.toString().split(':')[1]),
        );
      }
    });
  }
}
