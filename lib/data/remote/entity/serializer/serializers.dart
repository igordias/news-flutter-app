import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutterapptemplate/data/remote/entity/built_article.dart';
import 'package:flutterapptemplate/data/remote/entity/built_source.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  BuiltArticle,
  BuiltSource
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) {
  return serializers.deserializeWith<T>(
      serializers.serializerForType(T), value);
}

BuiltList<T> deserializeListOf<T>(dynamic value) {
  return BuiltList.from(
      value.map((value) => deserialize<T>(value)).toList(growable: false));
}
