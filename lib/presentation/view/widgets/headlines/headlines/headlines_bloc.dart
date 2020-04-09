import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';
import 'package:flutterapptemplate/domain/interactor/GetArticle.dart';
import 'package:flutterapptemplate/presentation/structure/base_bloc.dart';

import 'package:rxdart/rxdart.dart';

part 'headlines_event.dart';
part 'headlines_state.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, HeadlinesState> {
  @override
  HeadlinesState get initialState => HeadlinesInitialState();

  @override
  Stream<HeadlinesState> mapEventToState(
    HeadlinesEvent event,
  ) async* {
    if (event is GetHeadlinesForCountry) {
      yield HeadlinesLoadingState();
      yield await _getTopHeadlines(event);
    }
    if (event is HeadlinesInitialState) {
      yield HeadlinesLoadingState();
      yield await _getTopHeadlines(GetHeadlinesForCountry("us"));
    }
  }

  Future<HeadlinesState> _getTopHeadlines(GetHeadlinesForCountry event) {
    return GetArticle.getTopHeadlines(event.countryCode)
        .then((headlines) => HeadlinesLoadedState(headlines))
        .catchError((error) => _onError(error, () {
              add(event);
            }));
  }

  HeadlinesState _onError(Exception error, Function tryAgainAction) {
    addToErrorSink(error, tryAgainAction);
    return HeadlinesErrorState(error);
  }
}
