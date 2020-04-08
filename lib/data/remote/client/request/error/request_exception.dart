import 'dart:async';
import 'dart:io';

import 'package:flutterapptemplate/data/remote/client/request/api_error_body.dart';
import 'package:flutterapptemplate/data/remote/client/request/error/error_type.dart';

import 'dart:developer';

class RequestException implements Exception {
  final String _message;
  final int _code;
  final ErrorType _type;
  final Exception _exception;

  String get message => _message;
  int get code => _code;
  ErrorType get type => _type;
  Exception get exception => _exception;


  RequestException(this._code, this._message, this._type, this._exception);

  String toString() {
    return "$_code: $_message";
  }

  static RequestException onTimeoutException(TimeoutException exception) {
    return RequestException(null, null, ErrorType.TIMEOUT, exception);
  }

  static RequestException onSocketException(SocketException exception) {
    return RequestException(null, null, ErrorType.SOCKET, exception);
  }

  static RequestException onNetworkException(IOException exception) {
    return RequestException(null, null, ErrorType.NETWORK, exception);
  }

  static RequestException onUnexpectedException(Exception exception) {
    log(exception.toString());
    return RequestException(null, exception.toString(), ErrorType.UNEXPECTED, exception);
  }

  static RequestException onHttpException(int code, Map body){
    ApiErrorBody apiError = ApiErrorBody(body);
    return RequestException(code, apiError.message, ErrorType.HTTP, null);
  }

  bool isErrorType(ErrorType errorType) => this._type == errorType;
  bool isTimeoutException() => isErrorType(ErrorType.TIMEOUT);
  bool isSocketException() => isErrorType(ErrorType.SOCKET);
  bool isNetworkException() => isErrorType(ErrorType.NETWORK);
  bool isUnexpectedException() => isErrorType(ErrorType.UNEXPECTED);
  bool isHttpException() => isErrorType(ErrorType.HTTP);
}
