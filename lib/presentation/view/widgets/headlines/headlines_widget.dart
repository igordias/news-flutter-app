import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';
import 'package:flutterapptemplate/presentation/view/widgets/headlines/bloc/headlines_bloc.dart';

class HeadlinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _headlinesBloc = HeadlinesBloc();

    return Scaffold(
      body: Center(
        child: BlocBuilder(
          bloc: _headlinesBloc,
          builder: (context, state) {
            if (state is HeadlinesInitialState) {
              _headlinesBloc.add(GetHeadlinesForCountry("br"));
              return Container(
                height: 0.0,
                width: 0.0,
              );
            }
            if (state is HeadlinesLoadingState) return _buildLoading();
            if (state is HeadlinesLoadedState)
              return _builtArticleCards(state.headlines);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _headlinesBloc.add(GetHeadlinesForCountry("br"));
        },
        tooltip: 'Update',
        child: Icon(Icons.update),
      ),
    );
  }
}

Widget _builtArticleCards(List<Article> articles) {
  return ListView.builder(
    itemCount: articles.length,
    itemBuilder: (context, index) {
      final item = articles[index];
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.chrome_reader_mode),
                title: Text(item.title),
                subtitle: Text(item.source.name)),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('READ'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
