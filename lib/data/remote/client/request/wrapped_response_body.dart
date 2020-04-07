import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/entity/serializer/serializers.dart';
import 'package:http/src/base_response.dart';

class WrappedResponseBody<T> {
  static const KEY_STATUS = "status";
  static const KEY_TOTAL_RESULTS = "totalResults";
  static const KEY_CODE = "code";
  static const KEY_MESSAGE = "message";

  String _status;
  int _totalResults;
  String _code;
  String _message;
  dynamic _result;

  String get status => this.status;
  int get totalResults => this._totalResults;
  String get code => this._code;
  String get message => this._message;
  dynamic get result => this._result;

  WrappedResponseBody(Map bodyMap) {
    this._status = bodyMap[KEY_STATUS];
    this._totalResults = bodyMap[KEY_TOTAL_RESULTS];
    this._code = bodyMap[KEY_CODE];
    this._message = bodyMap[KEY_MESSAGE];
    this._result = _convertToCustomObject<T>(bodyMap);
  }

  dynamic _findObject(Map bodyMap) {
    return bodyMap.entries.firstWhere((tuple) =>
        tuple.key != KEY_STATUS &&
        tuple.key != KEY_TOTAL_RESULTS &&
        tuple.key != KEY_CODE &&
        tuple.key != KEY_MESSAGE);
  }

  dynamic _convertToCustomObject<T>(Map bodyMap) {
    dynamic object = _findObject(bodyMap);
    return _deserializeObject<T>(object);
  }

  dynamic _deserializeObject<T>(dynamic object) {
    if (object is MapEntry) object = object.value;

    if (object is T) return object;
    if (object is List) return deserializeListOf<T>(object);
    return deserialize<T>(object);
  }
}
