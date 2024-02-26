
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/data_manager.dart';
import '/core/app_export.dart';
import '../../../data/models/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

/// A bloc that manages the state of a News according to the event that is dispatched to it.
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(NewsState initialState) : super(initialState) {
    on<NewsInitialEvent>(_onInitialize);
  }

  _onInitialize(
      NewsInitialEvent event,
      Emitter<NewsState> emit,
      ) async {
    emit(
      state.copyWith(
          newsModelObj: await DataManager.getAllNews(),
         ),
    );
  }


}
