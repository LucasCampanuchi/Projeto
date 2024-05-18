import 'package:projeto_teste/common/base.model.dart';

class PaginationBase<T extends BaseModel> {
  PaginationBase({
    required this.count,
    required this.page,
    required this.totalPages,
    required this.nextPage,
    required this.previousPage,
    required this.showingFrom,
    required this.showingTo,
    required this.items,
  });
  late final int count;
  late final int page;
  late final int totalPages;
  late final int nextPage;
  late final int previousPage;
  late final int showingFrom;
  late final int showingTo;
  late final List<T> items;

  PaginationBase.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    count = json['count'];
    page = json['page'];
    totalPages = json['totalPages'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
    showingFrom = json['showingFrom'];
    showingTo = json['showingTo'];
    items = List.from(json['items'])
        .map(
          (e) => fromJson(e),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['page'] = page;
    data['totalPages'] = totalPages;
    data['nextPage'] = nextPage;
    data['previousPage'] = previousPage;
    data['showingFrom'] = showingFrom;
    data['showingTo'] = showingTo;
    data['items'] = items;
    return data;
  }
}
