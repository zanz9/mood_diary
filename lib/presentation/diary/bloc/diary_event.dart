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

class OnDiarySave extends DiaryEvent {
  final TextEditingController note;
  final BuildContext context;

  OnDiarySave({
    required this.note,
    required this.context,
  });
}

class OnDiaryStressLevelChange extends DiaryEvent {
  final int stressLevel;
  OnDiaryStressLevelChange({required this.stressLevel});
}

class OnDiarySelfRatingChange extends DiaryEvent {
  final int selfRating;
  OnDiarySelfRatingChange({required this.selfRating});
}
