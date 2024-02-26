part of 'quiz_results_bloc.dart';

@immutable
abstract class QuizResultsState {}

class QuizResultsInitialState extends QuizResultsState {}

class QuizResultsLoadingState extends QuizResultsState {}

class QuizResultsEmptyState extends QuizResultsState {}

class QuizResultsLoadedState extends QuizResultsState {
  final List<QuizResultModel> results;

  QuizResultsLoadedState(this.results);
}
