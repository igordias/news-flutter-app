import 'package:flutterapptemplate/data/remote/client/request/api_response_body.dart';

class ApiErrorBody {
  String _code;
  String _message;
  String _status;

  String get status => this.status;
  String get code => this._code;
  String get message => this._message;

  ApiErrorBody(Map bodyMap) {
    this._status = bodyMap[ApiResponseBody.KEY_STATUS];
    this._code = bodyMap[ApiResponseBody.KEY_CODE];
    this._message = bodyMap[ApiResponseBody.KEY_MESSAGE];
  }
}
