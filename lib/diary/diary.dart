import 'package:flutter/material.dart';
import 'package:mood_diary/diary/widgets/mood_list_view.dart';
import 'package:mood_diary/diary/widgets/note_text_area.dart';
import 'package:mood_diary/diary/widgets/slider_widget.dart';
import 'package:mood_diary/diary/widgets/title_widget.dart';

class Diary extends StatelessWidget {
  const Diary({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleWidget(text: 'Что чувствуешь?'),
        const MoodListView(),
        const TitleWidget(text: 'Уровень стресса'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SliderWidget(
            leftLabel: 'Низкий',
            rightLabel: 'Высокий',
          ),
        ),
        const TitleWidget(text: 'Самооценка'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SliderWidget(
            leftLabel: 'Неуверенность',
            rightLabel: 'Уверенность',
          ),
        ),
        const TitleWidget(text: 'Заметки'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NoteTextArea(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'Сохранить',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]
          .map((el) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8), child: el))
          .toList() as List<Widget>,
    );
  }
}
