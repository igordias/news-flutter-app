import 'package:flutterapptemplate/data/remote/client/api_service.dart';
import 'package:flutterapptemplate/data/repository/default_articles_repository.dart';
import 'package:flutterapptemplate/domain/boundary/articles_repository.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';

part 'repository_provider_module.g.dart';

abstract class RepositoryProviderModule {
  static Container container;

  static void setup(){
    container = Injector.container;
    _$RepositoryProviderModule()._configure();
  }

  @Register.factory(ArticlesRepository, from: DefaultArticlesRepository)
  void _configure();
}