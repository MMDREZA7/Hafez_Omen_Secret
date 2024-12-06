part of 'theme_changer_bloc.dart';

@immutable
sealed class ThemeChangerEvent {}

class ChangeThemeEvent extends ThemeChangerEvent {}

class FirstTimeToOpenApp extends ThemeChangerEvent {}
