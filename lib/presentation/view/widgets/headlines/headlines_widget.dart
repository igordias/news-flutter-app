import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';
import 'package:flutterapptemplate/presentation/view/widgets/headlines/bloc/headlines_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HeadlinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _headlinesBloc = HeadlinesBloc();

    return Scaffold(
      body: BlocBuilder(
        bloc: _headlinesBloc,
        builder: (context, state) {
          if (state is HeadlinesInitialState) {
            _headlinesBloc.add(GetHeadlinesForCountry("us"));
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _headlinesBloc.add(GetHeadlinesForCountry("us"));
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
    itemBuilder: (context, index) => _buildArticleCard(articles[index]),
  );
}

Widget _buildArticleCard(Article article) {
  return Column(children: <Widget>[
    GestureDetector(
      onTap: () => _launchURL(article.url),
      child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(15),
          child: Column(children: <Widget>[
            Image.network(
              article.urlToImage,
              fit: BoxFit.fill,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(article.title,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w700)),
                    //Padding(padding: EdgeInsets.only(bottom: 8.0)),
                    //Text(item.description, textAlign: TextAlign.start),
                  ],
                )),
          ])),
    )
  ]);
}

Widget _buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
