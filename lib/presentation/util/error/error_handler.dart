import 'dart:developer';

import 'package:flutterapptemplate/data/remote/client/request/error/error_type.dart';
import 'package:flutterapptemplate/data/remote/client/request/error/http_error.dart';
import 'package:flutterapptemplate/data/remote/client/request/error/request_exception.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_request.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_service.dart';

class ErrorHandler {
  DialogService _dialogService = Injector.resolve<DialogService>();

  void handleException(Exception exception, Function tryAgainAction) {
    log(exception.toString());
    if (exception is RequestException) {
      _onRequestException(exception, tryAgainAction);
    } else {
      unexpectedErrorDialog(tryAgainAction);
    }
  }

  //TODO: implement localization
  void _onRequestException(
      RequestException exception, Function tryAgainAction) {
    log(exception.message.toString());

    switch (exception.type) {
      case ErrorType.HTTP:
        _onHttpErrorThrown(exception, tryAgainAction);
        break;
      case ErrorType.NETWORK:
        sendDialogRequest(
            "Connection error",
            "It wasn't possible to complete the operation. Please check your connection.",
            "TRY AGAIN",
            tryAgainAction);
        break;
      case ErrorType.SOCKET:
        sendDialogRequest(
            "Connection error",
            "It wasn't possible to complete the operation. Please check your connection.",
            "TRY AGAIN",
            tryAgainAction);
        break;
      case ErrorType.UNEXPECTED:
        sendDialogRequest(
            "Unexpected error",
            "It wasn't possible to complete the operation. Try again later.",
            "TRY AGAIN",
            tryAgainAction);
        break;
      case ErrorType.TIMEOUT:
        sendDialogRequest(
            "Connection error",
            "Operation timeout. Plesse, try again.",
            "TRY AGAIN",
            tryAgainAction);
        break;
    }
  }

  void _onHttpErrorThrown(RequestException exception, Function tryAgainAction) {
    final httpErrorType =
        HttpErrorTypeExtension.getTypeFromCode(exception.code);

    switch (httpErrorType) {
      case HttpErrorType.NOT_FOUND:
        sendDialogRequest(
            "Not found",
            "The resource you were looking for could not be found.",
            "TRY AGAIN",
            tryAgainAction);
        break;
      case HttpErrorType.TIMEOUT:
        sendDialogRequest("Timeout", "Operation timeout. Plesse, try again.",
            "TRY AGAIN", tryAgainAction);
        break;
      case HttpErrorType.INTERNAL_SERVER_ERROR:
        sendDialogRequest(
            "Error",
            "It wasn't possible to complete the operation. Try again later.",
            "TRY AGAIN",
            tryAgainAction);
        break;
      case HttpErrorType.UNEXPECTED_ERROR:
        unexpectedErrorDialog(tryAgainAction);
        break;
      default:
        sendDialogRequest("Error",
            exception.message ?? "An unexpected error ocurred.", null, null);
    }
  }

  void unexpectedErrorDialog(Function tryAgainAction) {
    sendDialogRequest(
        "Unexpected error",
        "It wasn't possible to complete the operation. Try again later.",
        "TRY AGAIN",
        tryAgainAction);
  }

  void sendDialogRequest(
      String title, String message, String buttonTitle, Function buttonAction) {
    DialogRequest dialogRequest = DialogRequest(
        title: title,
        message: message,
        buttonTitle: buttonTitle,
        buttonAction: buttonAction);
    _dialogService.showDialog(dialogRequest);
  }
}
