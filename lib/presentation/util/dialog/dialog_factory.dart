import 'package:flutter/material.dart';

class DialogFactory {
  final BuildContext _context;

  DialogFactory(this._context);

  //TODO: Localization
  void message(String title, String message) {
    showDialog(
        context: _context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(title),
            content: new Text(message),
            actions: <Widget>[
              FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  Future<void> action(
      String title, String message, String buttonText, Function action) async {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(title),
            content: new Text(message),
            actions: <Widget>[
              FlatButton(
                  child: Text(buttonText),
                  onPressed: () {
                    Navigator.pop(context, true);
                    action();
                  })
            ],
          );
        });
  }
}
