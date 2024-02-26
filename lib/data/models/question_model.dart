class Question {
  final String imageUrl;
  final String text; // Текст вопроса
  final List<String> answers; // Варианты ответа
  final int correctAnswer; // Правильный ответ

  const Question({
    required this.imageUrl,
    required this.text,
    required this.answers,
    required this.correctAnswer,
  });
}
