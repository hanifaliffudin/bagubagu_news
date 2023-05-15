import 'package:bagubagu_news/bloc/search/search_bloc.dart';
import 'package:bagubagu_news/models/top_headlines_model.dart';
import 'package:bagubagu_news/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search News'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, bottom: 18, top: 10),
              child: _SearchBar(),
            ),
            _SearchBody(),
          ],
        ),
      )),
    );
    ;
  }
}

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();
  late SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = context.read<SearchBloc>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _textController,
        autocorrect: false,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  _searchBloc.add(
                    GetSearchEvent(_textController.text),
                  );
                },
                icon: const Icon(Icons.search)),
            hintText: 'Search a news',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            )));
  }
}

class _SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const SizedBox(
              height: 400, child: Center(child: CircularProgressIndicator()));
        }

        if (state is SearchSuccess) {
          return state.topHeadlinesModel.totalResults == 0
              ? const Center(child: Text('No Results'))
              : _SearchResults(items: state.topHeadlinesModel);
        }
        return const Text('');
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({Key? key, required this.items}) : super(key: key);

  final TopHeadlinesModel items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.articles!.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsCard(
          articlesModel: items.articles![index],
        );
      },
    );
  }
}
