import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterapptemplate/data/remote/client/request/error/request_exception.dart';
import 'package:rxdart/rxdart.dart';

class RequestHandler {
  Future<T> request<T>(Future<Response<T>> response) {
    return response
        .then((response) => _checkHttpException(response))
        .catchError((error) => throw _resolveRequestException(error))
        .then((response) => response.body);
  }

  Response _checkHttpException(Response response) {
    if (response.isSuccessful) {
      return response;
    } else {
      throw RequestException.onHttpException(
          response.statusCode, response.body);
    }
  }

  RequestException _resolveRequestException(dynamic error) {
    switch (error.runtimeType) {
      case RequestException:
        return error;
      case TimeoutException:
        return RequestException.onTimeoutException(error);
      case SocketException:
        return RequestException.onSocketException(error);
      case IOException:
        return RequestException.onNetworkException(error);
      default:
        return RequestException.onUnexpectedException(error);
    }
  }
}
