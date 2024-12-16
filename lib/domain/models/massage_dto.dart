class MessageDTO {
  final String? reciverID;
  final String? senderID;
  final String? text;
  final String? chatID;
  final String? groupID;
  final String? senderMobileNumber;
  final String? receiverID;
  final String? receiverMobileNumber;
  final String? sentDateTime;
  final bool? isRead;

  MessageDTO({
    required this.reciverID,
    required this.senderID,
    required this.text,
    required this.chatID,
    required this.groupID,
    required this.senderMobileNumber,
    required this.receiverID,
    required this.receiverMobileNumber,
    required this.sentDateTime,
    required this.isRead,
  });
}
