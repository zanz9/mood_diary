import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/presentation/statistics/bloc/statistics_bloc.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocProvider(
      create: (context) => StatisticsBloc()..add(OnStatistics()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<StatisticsBloc, StatisticsState>(
          builder: (context, state) {
            if (state is StatisticsLoaded) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.historyList.length,
                  itemBuilder: (context, index) {
                    var history = state.historyList[index];
                    return Card(
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/moods/${history.iconId}.png'),
                                          const SizedBox(width: 5),
                                          Text(history.mood,
                                              style: theme.textTheme.bodyLarge),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 5.0,
                                        runSpacing: 5.0,
                                        children: [
                                          for (var i = 0;
                                              i < history.subMoods.length;
                                              i++)
                                            Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    strokeAlign: .2,
                                                    color: theme.hintColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(22),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3,
                                                        horizontal: 7),
                                                child:
                                                    Text(history.subMoods[i])),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('dd MMMM kk:mm')
                                          .format(history.date),
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    Text(
                                      'Уровень стресса ${history.stressLevel}',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    Text(
                                      'Самооценка ${history.selfRating}',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text('Заметка',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(history.note),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
