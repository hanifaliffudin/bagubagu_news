import 'package:bagubagu_news/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:bagubagu_news/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHeadlinesCategory extends StatefulWidget {
  const TopHeadlinesCategory({super.key});

  @override
  State<TopHeadlinesCategory> createState() => _TopHeadlinesCategoryState();
}

class _TopHeadlinesCategoryState extends State<TopHeadlinesCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
              builder: (context, state) {
                if (state is TopHeadlinesLoading) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (state is TopHeadlinesSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.topHeadlinesModel.articles != null ? state.topHeadlinesModel.articles!.length : 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      state.topHeadlinesModel.articles?.sort(
                          (b, a) => a.publishedAt!.compareTo(b.publishedAt!));
                      return NewsCard(
                        articlesModel: state.topHeadlinesModel.articles![index],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
