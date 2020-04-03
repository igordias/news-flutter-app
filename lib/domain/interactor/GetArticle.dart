import 'package:flutterapptemplate/domain/boundary/articles_repository.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:rxdart/rxdart.dart';

class GetArticle {
  static final _repository = Injector.resolve<ArticlesRepository>();

  static Future<List<Article>> getTopHeadlines(String countryCode) {
    return _repository.getTopHeadlines(countryCode);
  }
}