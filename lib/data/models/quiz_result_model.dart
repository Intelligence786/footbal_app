class QuizResultModel {
  final int correctAnswerCount;
  final int totalQuestionsCount;
  final DateTime dateTime;

  QuizResultModel({
    required this.correctAnswerCount,
    required this.totalQuestionsCount,
    required this.dateTime,
  });

  factory QuizResultModel.fromJson(Map<String, dynamic> json) {
    return QuizResultModel(
      correctAnswerCount: json['correctAnswerCount'],
      totalQuestionsCount: json['totalQuestionsCount'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'correctAnswerCount': correctAnswerCount,
      'totalQuestionsCount': totalQuestionsCount,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
