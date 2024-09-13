import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary/core/router/router.dart';
import 'package:mood_diary/presentation/diary/view/diary.dart';
import 'package:mood_diary/presentation/home/widgets/title_date_now.dart';
import 'package:mood_diary/presentation/home/widgets/toggle_button_widget.dart';
import 'package:mood_diary/presentation/statistics/view/statistics.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> selected = [true, false];
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
        children: [
          Center(
            child: ToggleButtonWidget(
              isSelected: selected,
              onTapFirst: () {
                setState(() {
                  selected = [true, false];
                });
              },
              onTapSecond: () {
                setState(() {
                  selected = [false, true];
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          if (selected[0]) const Diary(),
          if (selected[1]) const Statistics(),
        ],
      ),
    );
  }
}
