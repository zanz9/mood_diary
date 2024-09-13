import 'package:flutter/material.dart';

class MonthBuilder extends StatelessWidget {
  const MonthBuilder({
    super.key,
    required this.year,
    required this.month,
    required this.dayCount,
    required this.firstWeekDay,
    this.selected,
    this.today,
    this.onTap,
  });
  final int year;
  final String month;
  final int dayCount;
  final int firstWeekDay;
  final int? selected;
  final Function(int)? onTap;
  final int? today;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    int dayCounter = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          year.toString(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.hintColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(month[0].toUpperCase() + month.substring(1),
            style: theme.textTheme.bodyLarge),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dayCount + firstWeekDay - 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            if (index + 1 >= firstWeekDay) {
              var thisDay = dayCounter;
              return GestureDetector(
                onTap: () {
                  onTap?.call(thisDay);
                },
                child: AnimatedContainer(
                  duration: Durations.medium2,
                  margin: const EdgeInsets.all(8),
                  decoration: (selected != null && selected == dayCounter)
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: theme.primaryColor.withOpacity(0.35),
                        )
                      : BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      (today != null && today == dayCounter)
                          ? Container(
                              height: 6,
                              width: 6,
                              margin: const EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            )
                          : const SizedBox(),
                      Center(
                        child: Text('${dayCounter++}'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
