part of 'chat_theme_changer_bloc.dart';

@immutable
sealed class ChatThemeChangerState {
  final ThemeData theme;

  ChatThemeChangerState({
    required this.theme,
  });
}

final class ChatThemeChangerInitial extends ChatThemeChangerState {
  ChatThemeChangerInitial({required super.theme});
}

final class ChatThemeChangerLoading extends ChatThemeChangerState {
  ChatThemeChangerLoading({required super.theme});
}

final class ChatThemeChangerLoaded extends ChatThemeChangerState {
  ChatThemeChangerLoaded({required super.theme});
}
