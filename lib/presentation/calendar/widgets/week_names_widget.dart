import 'package:flutter/material.dart';

class WeekNamesWidget extends StatelessWidget {
  const WeekNamesWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('ПН',
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        Text('ВТ',
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        Text('СР',
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        Text('ЧТ',
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        Text('ПТ',
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        Text('СБ',
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        Text('ВС',
            style:
                theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
      ],
    );
  }
}
