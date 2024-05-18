import 'package:dio/dio.dart';

import '../api/api.dart';

class NewsService {
  Future<Response?> list(Map<String, dynamic> params) async {
    Dio instance = await ApiUtil.createDio();
    return await instance.get(
      'noticias',
      queryParameters: params,
    );
  }
}
