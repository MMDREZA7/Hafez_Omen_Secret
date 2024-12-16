part of 'chat_items_bloc.dart';

@immutable
class ChatItemsEvent {}

class ChatItemsGetItemsEvent extends ChatItemsEvent {
  final String token;

  ChatItemsGetItemsEvent({
    required this.token,
  });
}
