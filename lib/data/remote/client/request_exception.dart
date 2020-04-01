import 'dart:async';
import 'dart:io';

import 'package:flutterapptemplate/data/remote/client/request/error/error_type.dart';

class RequestException implements Exception {
  final String _message;
  final String _code;
  final ErrorType _type;
  final Exception _exception;

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

  static RequestException onUnexpectedException(Object error) {
    if (error is Exception) {
    } else {}
  }

  static RequestException onHttpException(int code, dynamic body){

  }
}
