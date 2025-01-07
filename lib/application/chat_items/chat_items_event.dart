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

class ChatItemsGetGroupMembersEvent extends ChatItemsEvent {
  final String token;
  final String groupID;

  ChatItemsGetGroupMembersEvent({
    required this.token,
    required this.groupID,
  });
}

class ChatItemsAddNewMemberToGroupEvent extends ChatItemsEvent {
  final String token;
  final String groupID;
  final String mobileNumber;
  final int role;

  ChatItemsAddNewMemberToGroupEvent({
    required this.token,
    required this.groupID,
    required this.mobileNumber,
    required this.role,
  });
}
