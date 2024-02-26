import 'package:bloc/bloc.dart';
import 'package:footbal_app/data/data_manager.dart';
import 'package:meta/meta.dart';

import '../../../data/models/match_models/match_model.dart';

part 'matches_event.dart';

part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc(MatchesInitial initialState) : super(initialState) {
    on<MatchesInitEvent>(_onInitialize);
  }

  _onInitialize(MatchesInitEvent event, Emitter<MatchesState> emit) async {
    emit(MatchesLoadingState());

    List<MatchModel> matches = await DataManager.fillMatchesData();

    List<MatchModel> inGameMatches = [matches[0], matches[1]];

    emit(MatchesLoadedState(inGameMatches, matches));
  }
}
