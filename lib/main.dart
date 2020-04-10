import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/util/dialog/dialog_manager.dart';
import 'package:flutterapptemplate/presentation/util/error/error_handler.dart';
import 'package:flutterapptemplate/presentation/util/error/error_stream_controller.dart';
import 'package:flutterapptemplate/presentation/view/widgets/headlines/headlines_widget.dart';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutterapptemplate/presentation/util/localization/string_resource.dart';

 void main() async {
  await Injector.setup();
  var localizationDelegate = Injector.resolve<LocalizationDelegate>();
  runApp(LocalizedApp(localizationDelegate, MyApp()));
}

class MyApp extends StatelessWidget {
  Stream _errorStream = Injector.resolve<ErrorStreamController>().stream;
  ErrorHandler _errorHandler = Injector.resolve<ErrorHandler>();

  @override
  Widget build(BuildContext context) {
    _initErrorHandler();

    LocalizationDelegate localizationDelegate =
        LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: _getMaterialApp(context, localizationDelegate),
    );
  }

  MaterialApp _getMaterialApp(BuildContext context, LocalizationDelegate localizationDelegate) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, widget) {
        return _initDialogManager(context, widget);
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        localizationDelegate
      ],
      supportedLocales: localizationDelegate.supportedLocales,
      locale: localizationDelegate.currentLocale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: translate(StringResource.News)),
    );
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
