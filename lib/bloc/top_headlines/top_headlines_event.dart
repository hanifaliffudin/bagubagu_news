part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesEvent {}

class GetTopHeadlinesEvent extends TopHeadlinesEvent {
  final String category;

  GetTopHeadlinesEvent(this.category);
}
