import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_diary/domain/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final moodNames = [
    'Радость',
    'Страх',
    'Бешенство',
    'Грусть',
    'Спокойствие',
    'Сила',
  ];

  int _currentMoodIndex = -1;
  int get currentMood => _currentMoodIndex;

  List<List> _currentSubMoods = [];

  int _stressLevel = 3;
  int get stressLevel => _stressLevel;
  int _selfRating = 3;
  int get selfRating => _selfRating;

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

    on<OnDiaryStressLevelChange>((event, emit) {
      _stressLevel = event.stressLevel;
    });

    on<OnDiarySelfRatingChange>((event, emit) {
      _selfRating = event.selfRating;
    });

    on<OnDiarySave>((event, emit) async {
      if (_currentMoodIndex == -1) return;
      bool isSelectedSubMood = false;
      for (var subMood in _currentSubMoods) {
        if (subMood[1] == true) {
          isSelectedSubMood = true;
        }
      }
      if (!isSelectedSubMood) return;
      if (event.note.text.trim().isEmpty) return;

      SharedPreferences prefs = GetIt.I<SharedPreferences>();
      List<String> selectedSubMoods = [];
      for (var subMood in _currentSubMoods) {
        if (subMood[1] == true) {
          selectedSubMoods.add(subMood[0]);
        }
      }
      HistoryModel history = HistoryModel(
        date: DateTime.now(),
        iconId: _currentMoodIndex,
        mood: moodNames[_currentMoodIndex],
        subMoods: selectedSubMoods,
        note: event.note.text.trim(),
        selfRating: _selfRating,
        stressLevel: _stressLevel,
      );
      List<String> historyList = prefs.getStringList('history') ?? [];
      historyList.add(jsonEncode(history.toJson()));
      await prefs.setStringList('history', historyList);

      _currentMoodIndex = -1;
      _currentSubMoods = [];
      event.note.clear();

      if (!event.context.mounted) return;
      showCupertinoModalPopup(
        context: event.context,
        builder: (context) {
          return const CupertinoAlertDialog(
            title: Text('Сохранена'),
          );
        },
      );
      emit(DiaryLoaded(subMoods: _currentSubMoods));
    });
  }
}
