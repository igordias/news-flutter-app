import 'package:data_classes/data_classes.dart';
import 'package:flutterapptemplate/domain/entity/mutable_source.dart';

part 'mutable_article.g.dart';

@GenerateDataClass()
class MutableArticle {
  @nullable
  String author;
  String title;
  @nullable 
  String description;
  @nullable 
  String url;
  @nullable 
  String urlToImage;
  @nullable 
  String publishedAt;
  @nullable 
  String content;
  @nullable
  MutableSource source;
}
