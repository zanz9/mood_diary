import 'package:flutter/material.dart';
import 'package:mood_diary/core/router/router.dart';
import 'package:mood_diary/core/theme/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mood Diary',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      locale: const Locale('ru', 'RU'),
    );
  }
}
