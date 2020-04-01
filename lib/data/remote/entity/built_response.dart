import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutterapptemplate/data/core/util/serializers.dart';
import 'package:flutterapptemplate/data/remote/entity/built_source.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';

part 'built_response.g.dart';

abstract class BuiltResponse
    implements Built<BuiltResponse, BuiltResponseBuilder> {
  @nullable
  String get status;
  @nullable
  int get totalResults;
  @nullable
  Object get articles;
  @nullable
  String get message;

  BuiltResponse._();

  factory BuiltResponse([updates(BuiltResponseBuilder b)]) = _$BuiltResponse;

  static Serializer<BuiltResponse> get serializer => _$builtResponseSerializer;

  static BuiltResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltResponse.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltResponse.serializer, this));
  }
}
