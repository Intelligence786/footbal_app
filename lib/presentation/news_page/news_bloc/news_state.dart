// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

/// Represents the state of News in the application.
class NewsState extends Equatable {
  NewsState( {this.newsModelObj,});

  List<NewsModel>? newsModelObj;

  @override
  List<Object?> get props => [
    newsModelObj,

  ];

  NewsState copyWith(
      {List<NewsModel>? newsModelObj}) {

    return NewsState(
      newsModelObj: newsModelObj ?? this.newsModelObj,
    );
  }
}
