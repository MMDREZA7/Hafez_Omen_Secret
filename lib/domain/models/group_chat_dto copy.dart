class groupChatItemDTO {
  final String id;
  final String groupName;
  final String lastMessageTime;
  final String createdByID;

  groupChatItemDTO({
    required this.id,
    required this.groupName,
    required this.lastMessageTime,
    required this.createdByID,
  });

  static groupChatItemDTO empty() => groupChatItemDTO(
        id: "",
        groupName: "",
        lastMessageTime: "",
        createdByID: "",
      );
}
