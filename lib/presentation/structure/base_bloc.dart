import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/util/error/error_stream_controller.dart';

extension BaseBloc on Bloc {
  void addToErrorSink(Exception exception, Function retryFunction) {
    ErrorStreamController errorSink = Injector.resolve<ErrorStreamController>();
    errorSink.add(exception, retryFunction);
  }
}
