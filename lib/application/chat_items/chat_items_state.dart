part of 'chat_items_bloc.dart';

@immutable
sealed class ChatItemsState {}

final class ChatItemsInitial extends ChatItemsState {}

final class ChatItemsLoading extends ChatItemsState {}

final class ChatItemsEmpty extends ChatItemsState {}

final class ChatItemsPrivateChatsLoaded extends ChatItemsState {
  final List<UserChatItemDTO> userChatItems;

  ChatItemsPrivateChatsLoaded({required this.userChatItems});
}

final class ChatItemsPublicChatsLoaded extends ChatItemsState {
  final List<GroupChatItemDTO> groupChatItem;

  ChatItemsPublicChatsLoaded({required this.groupChatItem});
}

final class ChatItemsError extends ChatItemsState {
  final String errorMessage;

  ChatItemsError({required this.errorMessage});
}
