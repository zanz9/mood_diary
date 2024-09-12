import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/diary/bloc/diary_bloc.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
  });
  final String leftLabel;
  final String rightLabel;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 3;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        height: 100,
        child: Column(
          children: [
            SfSliderTheme(
              data: SfSliderThemeData(
                tickOffset: const Offset(0, -30),
                tickSize: const Size(2, 10),
                thumbColor: theme.primaryColor,
                thumbStrokeColor: Colors.white,
                thumbStrokeWidth: 4,
              ),
              child: SfSlider(
                value: _value,
                onChanged: context.watch<DiaryBloc>().currentMood == -1
                    ? null
                    : (value) {
                        _value = value;
                        setState(() {});
                      },
                activeColor: theme.primaryColor,
                inactiveColor: theme.disabledColor,
                min: 0,
                max: 6,
                interval: 1,
                stepSize: 1,
                showTicks: true,
                tickShape: const SfTickShape(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.leftLabel,
                      style: TextStyle(color: theme.hintColor)),
                  Text(widget.rightLabel,
                      style: TextStyle(color: theme.hintColor)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
