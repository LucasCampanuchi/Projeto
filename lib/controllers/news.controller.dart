import 'package:dio/dio.dart';
import 'package:projeto_teste/common/pagintion.base.dart';
import 'package:projeto_teste/services/news.service.dart';

import '../api/exceptions.dart';
import '../models/news.model.dart';
import '../shared/message.dart';

class NewsController {
  final NewsService service = NewsService();

  Future<PaginationBase<NewsModel>?> list(
    Map<String, dynamic> params,
  ) async {
    try {
      Response<dynamic>? response = await service.list(params);

      if (response != null) {
        if (response.statusCode == 200) {
          return PaginationBase<NewsModel>.fromJson(
            response.data,
            (json) => NewsModel.fromJson(json),
          );
        }
      }
    } on DioException catch (dioError) {
      await DioExceptions().messageDioError(
        dioError,
      );
    } catch (e) {
      message(
        e.toString(),
      );
    }

    return null;
  }
}
