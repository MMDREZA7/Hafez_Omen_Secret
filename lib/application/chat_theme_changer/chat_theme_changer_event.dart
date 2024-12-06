part of 'chat_theme_changer_bloc.dart';

@immutable
sealed class ChatThemeChangerEvent {}

class ChangeChatPageTheme extends ChatThemeChangerEvent {}

class FirstTimeOpenChat extends ChatThemeChangerEvent {}
