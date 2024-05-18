import 'package:dio/dio.dart';

import '../../shared/message.dart';

class DioExceptions implements Exception {
  messageDioError(DioException dioException) async {
    message(
      fromDioError(
        dioException,
      ).toString(),
    );
  }

  fromDioError(
    DioException dioException,
  ) {
    String messageDesc;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        messageDesc = 'Requisição foi cancelada';
        break;
      case DioExceptionType.connectionTimeout:
        messageDesc = 'Timeout na conexão';
        break;
      case DioExceptionType.unknown:
        messageDesc = 'Falha na conexão';
        break;
      case DioExceptionType.receiveTimeout:
        messageDesc = 'Timeout na resposta do servidor';
        break;
      case DioExceptionType.badResponse:
        messageDesc = _handleError(
          dioException.response!.statusCode!,
          dioException.response!.data,
          dioException.requestOptions.path,
        );
        break;
      case DioExceptionType.sendTimeout:
        messageDesc = 'Timeout no envio da requisição';
        break;
      default:
        messageDesc = 'Algo deu errado';
        break;
    }

    return messageDesc;
  }

  String _handleError(
    int statusCode,
    dynamic error,
    String path,
  ) {
    switch (statusCode) {
      case 400:
        return 'Requisição inválida';
      case 401:
        return 'Não autorizado';
      case 403:
        return 'Acesso negado';
      case 404:
        return 'Recurso não encontrado';
      case 500:
        return 'Erro interno no servidor';
      default:
        return 'Oops algo deu errado';
    }
  }
}
