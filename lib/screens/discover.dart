import 'package:bagubagu_news/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:bagubagu_news/screens/top_headlines_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'Business',
              ),
              Tab(
                text: 'Entertainment',
              ),
              Tab(
                text: 'General',
              ),
              Tab(
                text: 'Health',
              ),
              Tab(
                text: 'Science',
              ),
              Tab(
                text: 'Sports',
              ),
              Tab(
                text: 'Technology',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BlocProvider(
              create: (context) =>
                  TopHeadlinesBloc()..add(GetTopHeadlinesEvent('business')),
              child: const TopHeadlinesCategory(),
            ),
            BlocProvider(
              create: (context) => TopHeadlinesBloc()
                ..add(GetTopHeadlinesEvent('entertainment')),
              child: const TopHeadlinesCategory(),
            ),
            BlocProvider(
              create: (context) =>
                  TopHeadlinesBloc()..add(GetTopHeadlinesEvent('general')),
              child: const TopHeadlinesCategory(),
            ),
            BlocProvider(
              create: (context) =>
                  TopHeadlinesBloc()..add(GetTopHeadlinesEvent('health')),
              child: const TopHeadlinesCategory(),
            ),
            BlocProvider(
              create: (context) =>
                  TopHeadlinesBloc()..add(GetTopHeadlinesEvent('science')),
              child: const TopHeadlinesCategory(),
            ),
            BlocProvider(
              create: (context) =>
                  TopHeadlinesBloc()..add(GetTopHeadlinesEvent('sports')),
              child: const TopHeadlinesCategory(),
            ),
            BlocProvider(
              create: (context) =>
                  TopHeadlinesBloc()..add(GetTopHeadlinesEvent('technology')),
              child: const TopHeadlinesCategory(),
            ),
          ],
        ),
      ),
    );
  }
}
