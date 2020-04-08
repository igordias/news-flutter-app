import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapptemplate/data/remote/client/request/error/error_type.dart';
import 'package:flutterapptemplate/data/remote/client/request/error/http_error.dart';
import 'package:flutterapptemplate/data/remote/client/request/error/request_exception.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  @override
  ErrorState get initialState => ErrorInitial();

  @override
  Stream<ErrorState> mapEventToState(
    ErrorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  //TODO: Localization for these messages and titles
  ErrorState _onErrorThrown(RequestException exception) {
    switch (exception.type) {
      case ErrorType.HTTP:
        return _onHttpError(exception);
      case ErrorType.NETWORK:
        return ErrorDisplayState(
            "Connection error",
            "It wasn't possible to complete the operation. Please check your connection.",
            false);
      case ErrorType.SOCKET:
        return ErrorDisplayState(
            "Connection error",
            "It wasn't possible to complete the operation. Please check your connection.",
            false);
      case ErrorType.UNEXPECTED:
        return ErrorDisplayState(
            "Unexpected error",
            "It wasn't possible to complete the operation. Try again later.",
            false);
      case ErrorType.TIMEOUT:
        return ErrorDisplayState(
            "Connection error", "Operation timeout. Plesse, try again.", false);
    }
  }

  ErrorState _onHttpError(RequestException exception) {
    HttpErrorType httpErrorType =
        HttpErrorTypeExtension.getTypeFromCode(exception.code);

    switch (httpErrorType) {
      case HttpErrorType.NOT_FOUND:
        return ErrorDisplayState("Not found",
            "The resource you were looking for could not be found.", false);
      case HttpErrorType.TIMEOUT:
        return ErrorDisplayState(
            "Timeout", "Operation timeout. Plesse, try again.", false);
      case HttpErrorType.INTERNAL_SERVER_ERROR:
        return ErrorDisplayState(
            "Error",
            "It wasn't possible to complete the operation. Try again later.",
            false);
      case HttpErrorType.UNEXPECTED_ERROR:
        return ErrorDisplayState(
            "Unexpected error",
            "It wasn't possible to complete the operation. Try again later.",
            false);
      default:
        return ErrorDisplayState("Error",
            exception.message ?? "An unexpected error ocurred.", false);
    }
  }
}
