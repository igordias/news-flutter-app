import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutterapptemplate/data/core/util/serializers.dart';
import 'package:flutterapptemplate/domain/entity/mutable_source.dart';

part 'built_source.g.dart';

abstract class BuiltSource implements Built<BuiltSource, BuiltSourceBuilder> {
  @nullable
  String get id;
  @nullable
  String get name;

  BuiltSource._();

  factory BuiltSource([updates(BuiltSourceBuilder b)]) = _$BuiltSource;

  static Serializer<BuiltSource> get serializer => _$builtSourceSerializer;

  static BuiltSource fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltSource.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltSource.serializer, this));
  }

  Source toSource() => Source(id: this.id, name: this.name);
  MutableSource toMutableSource() => this.toSource().toMutable();
}
