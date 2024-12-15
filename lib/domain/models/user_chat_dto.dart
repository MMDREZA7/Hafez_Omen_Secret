class UserChatItemDTO {
  final String id;
  final String participant1ID;
  final String participant1MobileNumber;
  final String participant2ID;
  final String participant2MobileNumber;
  final String lastMessageTime;

  UserChatItemDTO({
    required this.id,
    required this.participant1ID,
    required this.participant1MobileNumber,
    required this.participant2ID,
    required this.participant2MobileNumber,
    required this.lastMessageTime,
  });

  static UserChatItemDTO empty() => UserChatItemDTO(
      id: "",
      participant1ID: "",
      participant1MobileNumber: "",
      participant2ID: "",
      participant2MobileNumber: "",
      lastMessageTime: "");
}
