import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_manager.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_service.dart';
import 'package:flutterapptemplate/presentation/util/error/error_handler.dart';
import 'package:flutterapptemplate/presentation/util/error/error_stream_controller.dart';
import 'package:flutterapptemplate/presentation/view/widgets/headlines/headlines_widget.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'domain/entity/mutable_article.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Stream _errorStream = Injector.resolve<ErrorStreamController>().stream;
  ErrorHandler _errorHandler = Injector.resolve<ErrorHandler>();

  @override
  Widget build(BuildContext context) {
    _initErrorHandler();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'News'),
        builder: (context, widget) {
          return _initDialogManager(context, widget);
        });
  }

  void _initErrorHandler() {
    _errorStream.listen((error) =>
        _errorHandler.handleException(error.exception, error.retryAction));
  }

  Widget _initDialogManager(BuildContext context, Widget widget) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => DialogManager(
          child: widget,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: HeadlinesWidget(),
    );
  }
}
