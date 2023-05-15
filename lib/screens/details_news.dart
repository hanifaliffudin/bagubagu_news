import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsNewsPage extends StatefulWidget {
  const DetailsNewsPage(
      {super.key, this.imageNews, this.title, this.content, this.url});

  final String? imageNews, title, content, url;

  @override
  State<DetailsNewsPage> createState() => _DetailsNewsPageState();
}

class _DetailsNewsPageState extends State<DetailsNewsPage> {
  Future<void> _launchUrl(urlNews) async {
    final Uri url = Uri.parse(urlNews);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 36),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      size: 36,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    child: widget.imageNews != null
                        ? Image.network(
                            widget.imageNews!,
                            width: 320,
                            fit: BoxFit.cover,
                          )
                        : SizedBox(
                            height: 200,
                            child: Icon(
                              Icons.image,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                widget.title != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.title!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const Text(""),
                const SizedBox(
                  height: 8,
                ),
                widget.content != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          widget.content!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : const Text(""),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () async {
                    _launchUrl(widget.url!);
                  },
                  child: const Chip(
                    label: Text('Read more'),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
