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

  bool monthView = true;

  @override
  void initState() {
    super.initState();
    var heightBlock = monthView ? 390 : 220;
    scrollController = ScrollController(
        initialScrollOffset: heightBlock * (now.month.toDouble() - 1));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var scale = 1.0;

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
              var heightBlock = monthView ? 390 : 220;
              scrollController.animateTo(
                heightBlock *
                    ((now.month.toDouble() - 1) / (monthView ? 1 : 2)),
                duration: const Duration(milliseconds: 700),
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
        bottom: monthView
            ? PreferredSize(
                preferredSize: const Size(double.infinity, 40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: WeekNamesWidget(theme: theme),
                ),
              )
            : null,
      ),
      body: GestureDetector(
        onScaleUpdate: (details) {
          scale = details.scale;
        },
        onScaleEnd: (details) {
          if (scale > 1.35) {
            setState(() {
              monthView = true;
            });
          } else if (scale < .65) {
            setState(() {
              monthView = false;
            });
          }
        },
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: monthView ? 1 : 2,
            mainAxisExtent: monthView ? 390 : 220,
          ),
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
              monthView: monthView,
            );
          },
        ),
      ),
    );
  }
}
