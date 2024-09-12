import 'package:flutter/material.dart';

class SubMoodWidget extends StatelessWidget {
  const SubMoodWidget({
    super.key,
    required this.text,
    this.isSelected = false,
  });
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      color: isSelected ? theme.primaryColor : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
