import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/app/application.dart';
import 'package:mood_diary/core/router/router.dart';

class Runner {
  Future<void> run() async {
    await initDateFormatter();
    runApp(Application(appRouter: initRouter()));
  }

  Future<void> initDateFormatter() async {
    await initializeDateFormatting('ru_RU', null);
    Intl.defaultLocale = 'RU';
  }

  AppRouter initRouter() {
    return AppRouter();
  }
}
