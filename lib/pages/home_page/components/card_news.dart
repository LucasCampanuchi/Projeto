import 'package:flutter/material.dart';
import 'package:projeto_teste/models/news.model.dart';

import '../../../components/image_widget.dart';
import '../../../shared/launch_url.dart';

class CardNews extends StatelessWidget {
  final NewsModel news;

  const CardNews({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchURL(news.link);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (news.imagens.isNotEmpty)
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                ),
                child: ImageWidget(
                  imageUrl: news.imagens.first,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    news.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    news.introducao,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
