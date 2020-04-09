import 'package:flutter/widgets.dart';

class DialogRequest {
  final String title;
  final String message;
  final String buttonTitle;
  final Function buttonAction;

  DialogRequest({
    @required this.title,
    @required this.message,
    @required this.buttonTitle,
    @required this.buttonAction,
  });
}
