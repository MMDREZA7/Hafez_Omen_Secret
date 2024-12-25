class GroupChatItemDTO {
  final String id;
  final String groupName;
  final String lastMessageTime;
  final String createdByID;

  GroupChatItemDTO({
    required this.id,
    required this.groupName,
    required this.lastMessageTime,
    required this.createdByID,
  });

  static GroupChatItemDTO empty() => GroupChatItemDTO(
        id: "",
        groupName: "",
        lastMessageTime: "",
        createdByID: "",
      );
}
