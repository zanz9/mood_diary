import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary/core/router/router.dart';
import 'package:mood_diary/presentation/diary/view/diary.dart';
import 'package:mood_diary/presentation/home/widgets/title_date_now.dart';
import 'package:mood_diary/presentation/home/widgets/toggle_button_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleDateNow(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.router.push(const CalendarRoute()),
            icon: const Icon(Icons.calendar_month_rounded),
          )
        ],
      ),
      body: ListView(
        children: const [
          Center(child: ToggleButtonWidget()),
          SizedBox(height: 16),
          Diary(),
        ],
      ),
    );
  }
}
