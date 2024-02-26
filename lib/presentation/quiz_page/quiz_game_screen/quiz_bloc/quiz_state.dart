part of 'quiz_bloc.dart';

@immutable
abstract class QuizState {}

class QuizInitialState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizOnProgressState extends QuizState {
  final List<Question> questions;
  final Question currentQuestion;
  final int currentQuestionIndex;

  final int correctAnswerCount;

  QuizOnProgressState(this.questions,  this.currentQuestion, this.currentQuestionIndex, this.correctAnswerCount);
}

class QuizAnsweredState extends QuizState {
  final bool isCorrect;

  QuizAnsweredState(this.isCorrect);
}

class QuizResultsShowState extends QuizState {
  final int correctAnswers;
  final int totalAnswers;

  QuizResultsShowState(this.correctAnswers, this.totalAnswers);
}
