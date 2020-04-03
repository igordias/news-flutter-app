import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapptemplate/domain/entity/mutable_article.dart';
import 'package:flutterapptemplate/domain/interactor/GetArticle.dart';

part 'headlines_event.dart';
part 'headlines_state.dart';

class HeadlinesBloc
    extends Bloc<HeadlinesEvent, HeadlinesState> {
  @override
  HeadlinesState get initialState => HeadlinesInitialState();

  @override
  Stream<HeadlinesState> mapEventToState(
    HeadlinesEvent event,
  ) async* {
    if (event is GetHeadlinesForCountry) {
      yield HeadlinesLoadingState();
      final headlines = await GetArticle.getTopHeadlines(event.countryCode);
      yield HeadlinesLoadedState(headlines);
    }
  }

  void _onInitialState() {
    final initialEvent = GetHeadlinesForCountry("br");
    _onGetHeadlinesForCountry(initialEvent);
  }

  dynamic _onGetHeadlinesForCountry(GetHeadlinesForCountry event) async* {
    print("_onGetHeadlinesForCountry");
    yield HeadlinesLoadingState();
    final headlines = await GetArticle.getTopHeadlines(event.countryCode);
    yield HeadlinesLoadedState(headlines);
  }
}
