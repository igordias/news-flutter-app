import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/client/environment.dart';

class AuthInterceptor extends HeadersInterceptor {
  static const HEADER_API_KEY = "X-Api-Key";

  AuthInterceptor()
      : super({
          HEADER_API_KEY: Environment.apiKey
        });
}
