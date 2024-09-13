import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_diary/domain/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitial()) {
    on<OnStatistics>((event, emit) {
      var prefs = GetIt.I<SharedPreferences>();
      List<String> historyList = prefs.getStringList('history') ?? [];
      if (historyList.isNotEmpty) {
        List<HistoryModel> history = [];
        for (var element in historyList) {
          history.add(HistoryModel.fromJson(jsonDecode(element)));
        }
        emit(StatisticsLoaded(historyList: history.reversed.toList()));
      }
    });
  }
}
