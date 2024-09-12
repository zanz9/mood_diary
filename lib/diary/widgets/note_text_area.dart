import 'package:flutter/material.dart';

class NoteTextArea extends StatelessWidget {
  const NoteTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          minLines: 4,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Введите заметку',
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }
}
