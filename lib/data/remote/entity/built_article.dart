import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutterapptemplate/data/core/util/serializers.dart';
import 'package:flutterapptemplate/data/remote/entity/built_source.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';

part 'built_article.g.dart';

abstract class BuiltArticle
    implements Built<BuiltArticle, BuiltArticleBuilder> {
  
  @nullable
  String get author;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  String get url;
  @nullable
  String get urlToImage;
  @nullable
  String get publishedAt;
  @nullable
  String get content;
  @nullable
  BuiltSource get source;

  BuiltArticle._();

  factory BuiltArticle([updates(BuiltArticleBuilder b)]) = _$BuiltArticle;

  static Serializer<BuiltArticle> get serializer => _$builtArticleSerializer;

  static BuiltArticle fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltArticle.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltArticle.serializer, this));
  }

  Article toArticle() {
    return Article(
        author: this.author,
        title: this.title,
        description: this.description,
        url: this.url,
        urlToImage: this.urlToImage,
        publishedAt: this.publishedAt,
        content: this.content,
        source: this.source.toMutableSource());
  }

  MutableArticle toMutableArticle() => this.toArticle().toMutable();
}
