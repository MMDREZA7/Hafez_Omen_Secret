part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoginSuccess extends AuthenticationState {
  final User user;

  AuthenticationLoginSuccess({
    required this.user,
  });
}

class AuthenticationRegisterSuccess extends AuthenticationState {
  final String responseMessage;

  AuthenticationRegisterSuccess({
    required this.responseMessage,
  });
}

class AuthenticationError extends AuthenticationState {
  final String errorText;

  AuthenticationError({
    required this.errorText,
  });
}
