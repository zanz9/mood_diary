import 'package:flutter/material.dart';
import 'package:mood_diary/diary/diary.dart';
import 'package:mood_diary/home/widgets/title_date_now.dart';
import 'package:mood_diary/home/widgets/toggle_button_widget.dart';

class Home extends StatelessWidget {
  const Home({
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
            onPressed: () {},
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
