// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:projeto_teste/api/constants.dart';

class ApiUtil {
  static Future<Dio> createDio({
    String version = 'v3',
  }) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: '$URL_BASE/api/$version/',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          return status! < 400 || status == 404;
        },
      ),
    );

    dio.options.connectTimeout = const Duration(
      seconds: 30,
    );
    dio.options.receiveTimeout = const Duration(
      seconds: 15,
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          print('REQUEST[${options.method}] => HEADERS: ${options.headers}');
          print('REQUEST[${options.method}] => DATA: ${options.data}');
          print('REQUEST[${options.method}] => COMPLETE PATH: ${options.uri}');
          print(
            'REQUEST[${options.method}] => QUERY: ${options.queryParameters}',
          );
          print(
            'REQUEST[${options.method}] => CANCEL TOKEN: ${options.cancelToken}',
          );
          print('REQUEST[${options.method}] => BASE URL: ${options.baseUrl}');

          CancelToken cancelToken = CancelToken();
          options.cancelToken = cancelToken;

          return handler.next(options);
        },
        onError: (e, handler) async {
          print(
            'ERROR[${e.response?.statusCode}] => MESSAGE: ${e.message}',
          );
          print(
            'ERROR[${e.response?.statusCode}] => DATA: ${e.response?.data}',
          );

          return handler.next(e);
        },
        onResponse: (response, handler) async {
          print(
            'RESPONSE[${response.statusCode}] => DATA: ${response.data}',
          );
          print(
            'RESPONSE[${response.statusCode}] => HEADERS: ${response.headers}',
          );
          print(
            'RESPONSE[${response.statusCode}] => STATUS: ${response.statusMessage}',
          );
          print(
            'RESPONSE[${response.statusCode}] => COMPLETE PATH: ${response.requestOptions.uri}',
          );

          return handler.next(response);
        },
      ),
    );

    return dio;
  }
}
