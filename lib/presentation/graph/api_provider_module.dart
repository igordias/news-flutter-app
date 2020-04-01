import 'package:chopper/chopper.dart';
import 'package:flutterapptemplate/data/remote/client/auth_interceptor.dart';
import 'package:flutterapptemplate/data/remote/client/built_value_converter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutterapptemplate/data/remote/client/api_client.dart';
import 'package:flutterapptemplate/data/remote/client/api_service.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';

part 'api_provider_module.g.dart';

abstract class ApiProviderModule {
  static Container container;

  static const String API_SERVICE = "API_SERVICE";
  static const String CHOPPER_CLIENT = "CHOPPER_CLIENT";
  static const String AUTH_INTERCEPTOR = "AUTH_INTERCEPTOR";
  static const String HTTP_LOGGING_INTERCEPTOR = "HTTP_LOGGING_INTERCEPTOR";
  static const String BUILT_VALUE_CONVERTER = "BUILT_VALUE_CONVERTER";

  static void setup() {
    container = Injector.container;
    _$ApiProviderModule()._configure();
  }

  void _configure() {
    _provideBuiltValueConverter();
    _provideInterceptors();
    _provideChopperClient();
    _provideApiService();
    //_provideApiClient();
  }

  void _provideApiService() {
    container.registerSingleton(
        (c) => ApiService.create(c<ChopperClient>(CHOPPER_CLIENT)),
        name: API_SERVICE
    );
    
    container.registerSingleton((c) => ApiClient(
      c<ApiService>(API_SERVICE)
    ));
  }

  @Register.singleton(BuiltValueConverter, name: BUILT_VALUE_CONVERTER)
  void _provideBuiltValueConverter();

  @Register.singleton(AuthInterceptor, name: AUTH_INTERCEPTOR)
  @Register.singleton(HttpLoggingInterceptor, name: HTTP_LOGGING_INTERCEPTOR)
  void _provideInterceptors();

  void _provideChopperClient() {
    List clientInterceptors = [
      container<AuthInterceptor>(AUTH_INTERCEPTOR),
      container<HttpLoggingInterceptor>(HTTP_LOGGING_INTERCEPTOR)
    ];

    ChopperClient chopperClient = ChopperClient(
        converter: BuiltValueConverter(),
        interceptors: clientInterceptors);
    
    container.registerInstance(chopperClient, name: CHOPPER_CLIENT);
  }
}
