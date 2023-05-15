part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesState {}

class TopHeadlinesInitial extends TopHeadlinesState {}

class TopHeadlinesLoading extends TopHeadlinesState {}

class TopHeadlinesSuccess extends TopHeadlinesState {
  final TopHeadlinesModel topHeadlinesModel;

  TopHeadlinesSuccess(this.topHeadlinesModel);
}
