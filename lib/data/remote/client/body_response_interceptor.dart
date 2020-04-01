import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/core/util/serializers.dart';

class BodyResponseInterceptor extends ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    Object object = serializers.deserialize(response.body);
    print("Intercepted" + object);
    return response;
  }
  
}