part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final TopHeadlinesModel topHeadlinesModel;

  SearchSuccess(this.topHeadlinesModel);
}
