part of 'messaging_bloc.dart';

abstract class MessagingState extends Equatable {
  const MessagingState();

  @override
  List<Object> get props => [];
}

class MessagingInitial extends MessagingState {}

class MessagingLoading extends MessagingState {}

class MessagingLoadEmpty extends MessagingState {}

class MessagingLoaded extends MessagingState {
  final List<MessageDTO?> messages;

  const MessagingLoaded({
    required this.messages,
  });

  @override
  List<Object> get props => [messages];
}

class MessagingError extends MessagingState {
  final String errorMessage;

  const MessagingError({required this.errorMessage});
}


// class MessagingLoadFail extends MessagingState {
//   final HttpFail fail;

//   const MessagingLoadFail({
//     required this.fail,
//   });

//   @override
//   List<Object> get props => [fail];
// }

// class MessagingUploadFileCanceled extends MessagingState {
//   const MessagingUploadFileCanceled();

//   @override
//   List<Object> get props => [];
// }

// class MessagingUploadFileFiled extends MessagingState {
//   final HttpFail fail;

//   const MessagingUploadFileFiled({
//     required this.fail,
//   });

//   @override
//   List<Object> get props => [fail];
// }


// class MessagingSendMessageFailed extends MessagingState {
//   final HttpFail fail;

//   const MessagingSendMessageFailed(this.fail);
// }

// class MessagingSendMessageSuccess extends MessagingState {
//   final List<ChatMessage?> messages;

//   const MessagingSendMessageSuccess({
//     required this.messages,
//   });

//   @override
//   List<Object> get props => [messages];
// }

// class MessagingDownloadingFile extends MessagingState {}
