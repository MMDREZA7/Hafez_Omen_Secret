part of 'chat_items_bloc.dart';

@immutable
class ChatItemsEvent {}

class ChatItemsGetPrivateChatsEvent extends ChatItemsEvent {
  final String token;

  ChatItemsGetPrivateChatsEvent({
    required this.token,
  });
}

class ChatItemsGetPublicChatsEvent extends ChatItemsEvent {
  final String token;

  ChatItemsGetPublicChatsEvent({
    required this.token,
  });
}
