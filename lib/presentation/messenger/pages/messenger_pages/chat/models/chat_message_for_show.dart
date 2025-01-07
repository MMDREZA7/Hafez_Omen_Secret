enum MessageStatus { not_sent, sent, not_view, viewed }

class ChatMessageForShow {
  final int id;
  final String text;
  final MessageStatus messageStatus;
  final bool isSender;
  final MessageMode? messageMode;

  ChatMessageForShow({
    required this.id,
    this.text = '',
    required this.messageStatus,
    required this.isSender,
    this.messageMode,
  });
}

enum MessageMode {
  text,
  file,
}
