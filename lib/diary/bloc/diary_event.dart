part of 'diary_bloc.dart';

@immutable
sealed class DiaryEvent {}

class OnDiaryMoodChanged extends DiaryEvent {
  final int mood;
  OnDiaryMoodChanged({required this.mood});
}

class OnDiarySubMoodChanged extends DiaryEvent {
  final int subMood;
  OnDiarySubMoodChanged({required this.subMood});
}

class OnDiarySave extends DiaryEvent {}
