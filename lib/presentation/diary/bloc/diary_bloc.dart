import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  int _currentMoodIndex = -1;
  List<List> _currentSubMoods = [];
  int get currentMood => _currentMoodIndex;

  DiaryBloc() : super(DiaryInitial()) {
    on<OnDiaryMoodChanged>((event, emit) {
      _currentMoodIndex = event.mood;
      _currentSubMoods = [
        ['Возбуждение', false],
        ['Восторг', false],
        ['Негатив', false],
        ['Нейтральное', false],
        ['Позитивное', false],
        ['Счастье', false],
        ['Чувственность', false],
        ['Злость', false],
        ['Радость', false],
      ];
      emit(DiaryLoaded(subMoods: _currentSubMoods));
    });

    on<OnDiarySubMoodChanged>((event, emit) {
      _currentSubMoods[event.subMood][1] = !_currentSubMoods[event.subMood][1];
      emit(DiaryLoaded(subMoods: _currentSubMoods));
    });

    on<OnDiarySave>((event, emit) {
      _currentMoodIndex = -1;
      _currentSubMoods = [];
      emit(DiaryLoaded(subMoods: _currentSubMoods));
    });
  }
}
