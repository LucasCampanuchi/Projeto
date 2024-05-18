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

  late final _$getNewsAsyncAction =
      AsyncAction('_HomePageStoreBase.getNews', context: context);

  @override
  Future<void> getNews() {
    return _$getNewsAsyncAction.run(() => super.getNews());
  }

  @override
  String toString() {
    return '''
news: ${news},
loading: ${loading}
    ''';
  }
}
