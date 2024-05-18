import 'package:flutter/material.dart';
import 'package:projeto_teste/pages/home_page/store/home_page.store.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HeaderNews extends StatelessWidget {
  final HomePageStore store;
  const HeaderNews({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: store.news == null,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Exibindo ${store.newsList.isNotEmpty ? 1 : 0} de ${store.newsList.length}',
                  ),
                ),
                Text(
                  '${store.news?.count} resultados',
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: store.searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar notícias',
                suffixIcon: InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    store.init();
                  },
                  child: const Icon(
                    Icons.search,
                    color: Color(0xFFD5D5D5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
