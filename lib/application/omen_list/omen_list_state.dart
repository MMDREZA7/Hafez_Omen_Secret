part of 'omen_list_bloc.dart';

@immutable
sealed class OmenListState {}

class OmenListInitial extends OmenListState {}

class OmenListLoading extends OmenListState {}

class OmenListLoaded extends OmenListState {
  final Omen omen;

  OmenListLoaded({
    required this.omen,
  });
}
