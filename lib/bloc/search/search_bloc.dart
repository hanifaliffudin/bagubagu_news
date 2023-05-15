import 'dart:convert';

import 'package:bagubagu_news/models/top_headlines_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bagubagu_news/app_constants.dart' as constants;

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  String endpoint = '/everything';

  SearchBloc() : super(SearchInitial()) {
    on<GetSearchEvent>((event, emit) async {
      emit(SearchLoading());

      final response = await http.get(Uri.parse(
          '${constants.AppConstants.baseUrl}$endpoint?apiKey=${constants.AppConstants.apiKey}&q=${event.keyword}&language=en&searchIn=title,description,content&sortBy=publishedAt'));

      emit(
          SearchSuccess(TopHeadlinesModel.fromJson(jsonDecode(response.body))));
    });
  }
}
