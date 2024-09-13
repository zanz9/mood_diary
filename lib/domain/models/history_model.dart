class HistoryModel {
  final int iconId;
  final String mood;
  final List<String> subMoods;
  final int stressLevel;
  final int selfRating;
  final String note;
  final DateTime date;

  HistoryModel({
    required this.iconId,
    required this.mood,
    required this.subMoods,
    required this.stressLevel,
    required this.selfRating,
    required this.note,
    required this.date,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      iconId: json['iconId'],
      mood: json['mood'],
      subMoods: json['subMoods'],
      stressLevel: json['stressLevel'],
      selfRating: json['selfRating'],
      note: json['note'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iconId': iconId,
      'mood': mood,
      'subMoods': subMoods,
      'stressLevel': stressLevel,
      'selfRating': selfRating,
      'note': note,
      'date': date.toIso8601String(),
    };
  }
}
