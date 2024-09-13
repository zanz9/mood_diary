import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  ToggleButtonWidgetState createState() => ToggleButtonWidgetState();
}

class ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = [true, false];
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected[0] ? theme.primaryColor : Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.book_outlined,
                    color: isSelected[0] ? Colors.white : Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Дневник настроения',
                  style: TextStyle(
                    color: isSelected[0] ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = [false, true];
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected[1] ? theme.primaryColor : Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.bar_chart_outlined,
                    color: isSelected[1] ? Colors.white : Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Статистика',
                  style: TextStyle(
                    color: isSelected[1] ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
