import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class TitleDateNow extends StatelessWidget {
  const TitleDateNow({super.key});

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      const Duration(minutes: 1),
      builder: (context) => Text(
        DateFormat('dd MMMM kk:mm').format(DateTime.now()),
      ),
    );
  }
}
