import 'package:flutter/material.dart';
import 'package:mood_diary/core/router/router.dart';
import 'package:mood_diary/core/theme/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Mood Diary',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
