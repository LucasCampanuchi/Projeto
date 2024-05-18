import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_teste/common/pagintion.base.dart';
import 'package:projeto_teste/controllers/news.controller.dart';
import 'package:projeto_teste/models/news.model.dart';
part 'home_page.store.g.dart';

class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  final NewsController _controller = NewsController();

  @observable
  PaginationBase<NewsModel>? news;

  @observable
  ObservableList<NewsModel> newsList = ObservableList<NewsModel>();

  @observable
  bool loading = false;

  @observable
  int page = 1;

  @observable
  TextEditingController searchController = TextEditingController();

  @action
  Future<void> getNews() async {
    loading = true;

    Map<String, dynamic> params = {
      'qtd': '10',
      'page': page.toString(),
    };

    if (searchController.text.isNotEmpty) {
      params['busca'] = searchController.text;
    }

    await Future.delayed(
      const Duration(milliseconds: 1200),
    );

    final response = await _controller.list(
      params,
    );

    if (response != null) {
      news = response;
      newsList.addAll(news!.items);

      if (news!.items.isNotEmpty) {
        page++;
      }
    }
    loading = false;
  }

  @action
  void init() {
    page = 1;
    newsList.clear();

    getNews();
  }
}
