import 'package:flutterapptemplate/data/remote/client/api_client.dart';
import 'package:flutterapptemplate/data/remote/client/api_service.dart';
import 'package:flutterapptemplate/data/remote/entity/built_article.dart';
import 'package:flutterapptemplate/domain/boundary/articles_repository.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';

class DefaultArticlesRepository implements ArticlesRepository {
  final ApiClient _apiClient = Injector.resolve<ApiClient>();

  //TODO: implement RX, deal with errors
  @override
  Future<List<Article>> getTopHeadlines() {
   return _apiClient
    .getTopHeadlines("br")
    .then((builtList) => builtList.map((builtArticle) => builtArticle.toArticle()).toList());
  }
}
