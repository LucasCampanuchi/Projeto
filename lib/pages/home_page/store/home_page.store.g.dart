// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStoreBase, Store {
  late final _$newsAtom =
      Atom(name: '_HomePageStoreBase.news', context: context);

  @override
  PaginationBase<NewsModel>? get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(PaginationBase<NewsModel>? value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  late final _$newsListAtom =
      Atom(name: '_HomePageStoreBase.newsList', context: context);

  @override
  ObservableList<NewsModel> get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(ObservableList<NewsModel> value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_HomePageStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_HomePageStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_HomePageStoreBase.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$fromDateAtom =
      Atom(name: '_HomePageStoreBase.fromDate', context: context);

  @override
  String? get fromDate {
    _$fromDateAtom.reportRead();
    return super.fromDate;
  }

  @override
  set fromDate(String? value) {
    _$fromDateAtom.reportWrite(value, super.fromDate, () {
      super.fromDate = value;
    });
  }

  late final _$toDateAtom =
      Atom(name: '_HomePageStoreBase.toDate', context: context);

  @override
  String? get toDate {
    _$toDateAtom.reportRead();
    return super.toDate;
  }

  @override
  set toDate(String? value) {
    _$toDateAtom.reportWrite(value, super.toDate, () {
      super.toDate = value;
    });
  }

  late final _$getNewsAsyncAction =
      AsyncAction('_HomePageStoreBase.getNews', context: context);

  @override
  Future<void> getNews() {
    return _$getNewsAsyncAction.run(() => super.getNews());
  }

  late final _$_HomePageStoreBaseActionController =
      ActionController(name: '_HomePageStoreBase', context: context);

  @override
  void setFromDate(DateTime? value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setFromDate');
    try {
      return super.setFromDate(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToDate(DateTime? value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.setToDate');
    try {
      return super.setToDate(value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void init() {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.init');
    try {
      return super.init();
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
news: ${news},
newsList: ${newsList},
loading: ${loading},
page: ${page},
searchController: ${searchController},
fromDate: ${fromDate},
toDate: ${toDate}
    ''';
  }
}
