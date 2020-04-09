import 'dart:async';

import 'package:flutterapptemplate/presentation/util/error/wrapped_error.dart';


class ErrorStreamController {
  final _controller = StreamController<WrappedError>();

  Stream get stream => _controller.stream.asBroadcastStream();

  void add(Exception exception, Function retryAction) {
    WrappedError error = WrappedError(exception, retryAction);
    _controller.sink.add(error);
  }
}
