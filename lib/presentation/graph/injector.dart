import 'package:flutterapptemplate/presentation/graph/module/api_provider_module.dart';
import 'package:flutterapptemplate/presentation/graph/module/repository_provider_module.dart';
import 'package:kiwi/kiwi.dart';

abstract class Injector {
  static Container container;

  static final resolve = container.resolve;

  static void setup(){
    container = Container();
    _setupModules();
  }

  static void _setupModules(){
    ApiProviderModule.setup();
    RepositoryProviderModule.setup();
  }
}