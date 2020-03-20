import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_user.g.dart';

abstract class BuiltUser implements Built<BuiltUser, BuiltUserBuilder> {
  @nullable
  int get id;

  String get email;

  String get password;

  String get token;

  BuiltUser._();

  factory BuiltUser([updates(BuiltUserBuilder b)]) = _$BuiltUser;

  static Serializer<BuiltUser> get serializer => _$builtUserSerializer;
}
