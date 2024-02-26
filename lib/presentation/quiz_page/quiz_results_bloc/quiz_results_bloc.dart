import 'package:bloc/bloc.dart';
import 'package:footbal_app/data/data_manager.dart';
import 'package:meta/meta.dart';

import '../../../data/models/quiz_result_model.dart';

part 'quiz_results_event.dart';

part 'quiz_results_state.dart';

class QuizResultsBloc extends Bloc<QuizResultsEvent, QuizResultsState> {
  QuizResultsBloc() : super(QuizResultsInitialState()) {
    on<QuizResultsInitEvent>(_onGetResultsData);
  }

  _onGetResultsData(
      QuizResultsInitEvent event, Emitter<QuizResultsState> emit) async {
    emit(QuizResultsLoadingState());

    List<QuizResultModel> results = await DataManager.readResults();

    if (results.length > 0) {
      emit(QuizResultsLoadedState(results));
    } else {
      emit(QuizResultsEmptyState());
    }
  }
}
