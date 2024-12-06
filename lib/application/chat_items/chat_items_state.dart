part of 'chat_items_bloc.dart';

@immutable
sealed class ChatItemsState {}

final class ChatItemsInitial extends ChatItemsState {}

final class ChatItemsLoading extends ChatItemsState {}

final class ChatItemsEmpty extends ChatItemsState {}

final class ChatItemsLoaded extends ChatItemsState {
  final List<UserChatItemDTO> userChatItems;

  ChatItemsLoaded({required this.userChatItems});
}

final class ChatItemsError extends ChatItemsState {
  final String errorMessage;

  ChatItemsError({required this.errorMessage});
}
