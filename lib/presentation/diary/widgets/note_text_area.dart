import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/presentation/diary/bloc/diary_bloc.dart';

class NoteTextArea extends StatelessWidget {
  const NoteTextArea({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autocorrect: false,
          controller: controller,
          minLines: 4,
          maxLines: null,
          enabled: context.watch<DiaryBloc>().currentMood != -1,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Введите заметку',
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }
}
