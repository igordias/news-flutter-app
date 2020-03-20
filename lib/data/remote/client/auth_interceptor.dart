import 'package:chopper/chopper.dart';

class AuthInterceptor extends HeadersInterceptor {
  static const HEADER_TOKEN_PARAM = "";
  static const HEADER_EMAIL_PARAM = "";

  //TODO: get information from cache
  AuthInterceptor() : super({HEADER_TOKEN_PARAM: "", HEADER_EMAIL_PARAM: ""});
}
