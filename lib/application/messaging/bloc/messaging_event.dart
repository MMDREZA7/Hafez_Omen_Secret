part of 'messaging_bloc.dart';

abstract class MessagingEvent extends Equatable {
  const MessagingEvent();

  @override
  List<Object> get props => [];
}

class MessagingGetMessages extends MessagingEvent {
  final String chatID;
  final String token;

  const MessagingGetMessages({
    required this.chatID,
    required this.token,
  });
}

class MessagingSendMessage extends MessagingEvent {
  final MessageDTO message;
  final String chatID;
  final bool isNewChat;
  final String token;

  const MessagingSendMessage({
    required this.message,
    required this.chatID,
    required this.isNewChat,
    required this.token,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

// class MessagingSendFileMessage extends MessagingEvent {
//   final MessageDTO message;

//   const MessagingSendFileMessage({
//     required this.message,
//   });

//   @override
//   List<Object> get props => [
//         message,
//       ];
// }

// class MessagingSeenMessage extends MessagingEvent {
//   final MessageDTO message;

//   const MessagingSeenMessage({
//     required this.message,
//   });

//   @override
//   List<Object> get props => [message];
// }

// class MessagingDeleteMessage extends MessagingEvent {
//   final int messageID;

//   const MessagingDeleteMessage({
//     required this.messageID,
//   });

//   @override
//   List<Object> get props => [messageID];
// }

// class MessagingDownloadFile extends MessagingEvent {
//   final FileInfo fileInfo;

//   MessagingDownloadFile({
//     required this.fileInfo,
//   });

//   @override
//   List<Object> get props => [
//         fileInfo,
//       ];
// }