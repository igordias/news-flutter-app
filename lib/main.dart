import 'package:flutter/material.dart';
import 'package:flutterapptemplate/domain/interactor/GetArticle.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
import 'package:flutterapptemplate/presentation/graph/injector.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _name = "NOTHING";
  int _counter = 0;

  void _runCode() {
    _fetchGrandMasterLeague();
  }

  //TODO: Implement BLOC!
  Future<List<Article>> _fetchGrandMasterLeague() async {
    List<Article> articles = await GetArticle().getTopHeadlines();
    if(articles != null){
      setState(() {
        this._name = articles.first.title.toString();
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_name',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runCode,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
