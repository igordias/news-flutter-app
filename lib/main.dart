import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapptemplate/domain/interactor/GetArticle.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/view/widgets/headlines/bloc/headlines_bloc.dart';
import 'package:flutterapptemplate/presentation/view/widgets/headlines/headlines_categories_widget.dart';
import 'package:flutterapptemplate/presentation/view/widgets/headlines/headlines_widget.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'domain/entity/mutable_article.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'News'),
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
