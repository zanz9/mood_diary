import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/presentation/diary/bloc/diary_bloc.dart';
import 'package:mood_diary/presentation/diary/widgets/mood_list_view.dart';
import 'package:mood_diary/presentation/diary/widgets/note_text_area.dart';
import 'package:mood_diary/presentation/diary/widgets/save_button.dart';
import 'package:mood_diary/presentation/diary/widgets/slider_widget.dart';
import 'package:mood_diary/presentation/diary/widgets/sub_mood_widget.dart';
import 'package:mood_diary/presentation/diary/widgets/title_widget.dart';

class Diary extends StatelessWidget {
  const Diary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const TitleWidget(text: 'Что чувствуешь?'),
          const MoodListView(),
          BlocBuilder<DiaryBloc, DiaryState>(
            builder: (context, state) {
              if (state is DiaryLoaded) {
                return Wrap(
                  children: [
                    for (var i = 0; i < state.subMoods.length; i++)
                      GestureDetector(
                        onTap: () {
                          context
                              .read<DiaryBloc>()
                              .add(OnDiarySubMoodChanged(subMood: i));
                        },
                        child: SubMoodWidget(
                          text: state.subMoods[i][0],
                          isSelected: state.subMoods[i][1],
                        ),
                      ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SaveButton(),
          ),
        ]
            .map((el) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8), child: el))
            .toList() as List<Widget>,
      ),
    );
  }
}
