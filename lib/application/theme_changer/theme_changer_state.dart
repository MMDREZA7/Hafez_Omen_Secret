part of 'theme_changer_bloc.dart';

@immutable
sealed class ThemeChangerState {}

class ThemeChangerInitial extends ThemeChangerState {}

class ThemeChangerLoading extends ThemeChangerState {}

class ThemeChangerLoaded extends ThemeChangerState {
  final ThemeData theme;

  ThemeChangerLoaded({
    required this.theme,
  });
}
