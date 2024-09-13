import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/presentation/diary/bloc/diary_bloc.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.read<DiaryBloc>().add(OnDiarySave()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: context.watch<DiaryBloc>().currentMood == -1
              ? theme.disabledColor
              : theme.primaryColor,
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
    );
  }
}
