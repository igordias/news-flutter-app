import 'package:flutter_translate_annotations/flutter_translate_annotations.dart';
import 'package:flutterapptemplate/presentation/util/constants.dart';

part 'string_resource.g.dart'; 

@TranslateKeysOptions(
    path: Constants.LOCALIZATION_PATH,
    caseStyle: CaseStyle.titleCase,
    separator: "_")
class _$StringResource {}
