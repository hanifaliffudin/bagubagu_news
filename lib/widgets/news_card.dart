import 'package:bagubagu_news/models/articles_model.dart';
import 'package:bagubagu_news/screens/details_news.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.articlesModel,
  });

  final ArticlesModel articlesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsNewsPage(
                  imageNews: articlesModel.urlToImage,
                  title: articlesModel.title,
                  content: articlesModel.content,
                  url: articlesModel.url)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: articlesModel.urlToImage != null
                    ? Image.network(
                        articlesModel.urlToImage!,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        child: const Icon(
                          Icons.image,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articlesModel.title != null ? articlesModel.title! : "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            articlesModel.publishedAt != null
                ? Text(DateFormat('dd MMMM yyyy')
                    .format(DateTime.parse(articlesModel.publishedAt!)))
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
