part of 'diary_bloc.dart';

@immutable
sealed class DiaryState {}

final class DiaryInitial extends DiaryState {}

final class DiaryLoaded extends DiaryState {
  final List<List> subMoods;

  DiaryLoaded({required this.subMoods});
}
