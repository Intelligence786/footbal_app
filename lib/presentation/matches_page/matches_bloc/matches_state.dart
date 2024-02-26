part of 'matches_bloc.dart';

@immutable
abstract class MatchesState {}

class MatchesInitial extends MatchesState {}

class MatchesLoadingState extends MatchesState {}

class MatchesLoadedState extends MatchesState {
  final List<MatchModel> inGameMathesList;
  final List<MatchModel> upcomingMatchesList;

  MatchesLoadedState(this.inGameMathesList, this.upcomingMatchesList);
}
