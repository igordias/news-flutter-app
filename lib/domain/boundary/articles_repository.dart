import 'package:flutterapptemplate/domain/entity/mutable_article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getTopHeadlines();
}
