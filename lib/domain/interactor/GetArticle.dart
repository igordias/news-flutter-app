import 'package:flutterapptemplate/domain/boundary/articles_repository.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:rxdart/rxdart.dart';

class GetArticle {
  final _repository = Injector.resolve<ArticlesRepository>();

  Future<List<Article>> getTopHeadlines() {
    return _repository.getTopHeadlines();
  }
}