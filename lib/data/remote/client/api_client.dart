import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/client/auth_interceptor.dart';
import 'environment.dart';

class ApiClient extends ChopperClient {
  ApiClient(Iterable<ChopperService> services) {
    ChopperClient(
        baseUrl: Environment.entryPoint,
        services: services,
        converter: JsonConverter(),
        interceptors: getInterceptors());
  }

  static Iterable getInterceptors() {
    return [AuthInterceptor(), HttpLoggingInterceptor()];
  }
}
