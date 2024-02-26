part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class QuizStartedEvent extends QuizEvent {}

class QuizAnswerSubmittedEvent extends QuizEvent {
  final int answerIndex;

   QuizAnswerSubmittedEvent(this.answerIndex);
}

