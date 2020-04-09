import 'dart:async';

import 'package:flutterapptemplate/presentation/util/dialog/dialog_request.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_response.dart';

class DialogService {
  Function(DialogRequest) _showDialogListener;
  Completer<DialogResponse> _dialogCompleter;

  void registerDialogListener(Function(DialogRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<DialogResponse> showDialog(DialogRequest dialogRequest) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener(dialogRequest);
    return _dialogCompleter.future;
  }

  void dialogComplete(DialogResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
