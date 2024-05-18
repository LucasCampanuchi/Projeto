import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/image_widget.dart';

class CardNewsSkeleton extends StatelessWidget {
  const CardNewsSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 200,
              ),
              child: const ImageWidget(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Título da notícia',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                    style: TextStyle(
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
