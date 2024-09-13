import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/presentation/calendar/widgets/month_builder.dart';
import 'package:mood_diary/presentation/calendar/widgets/week_names_widget.dart';

@RoutePage()
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late ScrollController scrollController;
  DateTime now = DateTime.now();
  DateTime selected = DateTime.now();

  @override
  void initState() {
    super.initState();
    var heightBlock = 351;
    scrollController = ScrollController(
        initialScrollOffset: heightBlock * (now.month.toDouble() - 1));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: Icon(
            Icons.close,
            color: theme.hintColor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              var heightBlock = 351;
              scrollController.animateTo(
                heightBlock * (now.month.toDouble() - 1),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              );
              selected = now;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                'Сегодня',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: WeekNamesWidget(theme: theme),
          ),
        ),
      ),
      body: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 12,
        itemBuilder: (context, index) {
          int monthDayCount = DateTime(now.year, index + 1 + 1, 0).day;
          int firstWeekDay = DateTime(now.year, index + 1, 1).weekday;
          return MonthBuilder(
            year: now.year,
            month: DateFormat.MMMM().format(DateTime(now.year, index + 1)),
            dayCount: monthDayCount,
            firstWeekDay: firstWeekDay,
            today: now.month == index + 1 ? now.day : null,
            selected: selected.month == index + 1 ? selected.day : null,
            onTap: (day) {
              selected = DateTime(now.year, index + 1, day);
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
