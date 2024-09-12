import 'package:flutter/material.dart';

class MoodListView extends StatelessWidget {
  const MoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    const moodNames = [
      'Радость',
      'Страх',
      'Бешенство',
      'Грусть',
      'Спокойствие',
      'Сила',
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return MoodWidget(
            index: index,
            text: moodNames[index],
          );
        },
      ),
    );
  }
}

class MoodWidget extends StatelessWidget {
  const MoodWidget({
    super.key,
    required this.index,
    required this.text,
  });
  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(76),
        // border: Border.all(
        //   color: theme.primaryColor,
        //   width: 2,
        // ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            offset: const Offset(2, 4),
            blurRadius: 10.8,
            spreadRadius: 0,
          )
        ],
      ),
      margin: const EdgeInsets.only(left: 16, bottom: 20, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/moods/$index.png'),
          const SizedBox(height: 8),
          Text(
            text,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}