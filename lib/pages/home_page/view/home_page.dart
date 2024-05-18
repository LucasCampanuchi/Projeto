import 'package:flutter/material.dart';
import 'package:projeto_teste/api/constants.dart';
import 'package:projeto_teste/pages/home_page/components/card_news.dart';
import 'package:projeto_teste/pages/home_page/components/header_news.dart';
import 'package:projeto_teste/pages/home_page/store/home_page.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../components/image_widget.dart';
import '../components/card_news_skeleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = HomePageStore();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    store.init();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        store.getNews();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Bem-vindo!'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              HeaderNews(
                store: store,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    store.init();
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        ...List.generate(
                          store.newsList.length,
                          (index) {
                            final news = store.newsList[index];

                            return CardNews(
                              news: news,
                            );
                          },
                        ),
                        if (store.loading)
                          ...List.generate(
                            5,
                            (index) {
                              return const CardNewsSkeleton();
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}