import 'dart:convert';

import 'package:bagubagu_news/models/top_headlines_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bagubagu_news/app_constants.dart' as constants;

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  String endpoint = '/top-headlines';

  TopHeadlinesBloc() : super(TopHeadlinesInitial()) {
    on<GetTopHeadlinesEvent>((event, emit) async {
      emit(TopHeadlinesLoading());

      final response = await http.get(Uri.parse(
          '${constants.AppConstants.baseUrl}$endpoint?apiKey=${constants.AppConstants.apiKey}&category=${event.category}&language=en'));

      emit(TopHeadlinesSuccess(
          TopHeadlinesModel.fromJson(jsonDecode(response.body))));
    });
  }
}
