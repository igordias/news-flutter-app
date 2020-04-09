import 'package:flutter/material.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_factory.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_request.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_service.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = Injector.resolve<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener((dialogRequest) {
      _onAlertRequest(dialogRequest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _onAlertRequest(DialogRequest dialogRequest) {
    if (dialogRequest.buttonAction != null) {
      buildActionDialog(dialogRequest);
    } else {
      buildMessageDialog(dialogRequest);
    }
  }

  void buildActionDialog(DialogRequest dialogRequest) {
    DialogFactory(context).action(dialogRequest.title, dialogRequest.message,
        dialogRequest.buttonTitle, dialogRequest.buttonAction);
  }

  void buildMessageDialog(DialogRequest dialogRequest) {
    DialogFactory(context).message(dialogRequest.title, dialogRequest.message);
  }
}
