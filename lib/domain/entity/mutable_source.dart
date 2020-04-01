import 'package:data_classes/data_classes.dart';

part 'mutable_source.g.dart';

@GenerateDataClass()
class MutableSource {
  @nullable
  String id;
  String name;
}
