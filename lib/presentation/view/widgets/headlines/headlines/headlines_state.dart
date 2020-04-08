part of 'headlines_bloc.dart';

abstract class HeadlinesState extends Equatable {
  const HeadlinesState();
}

class HeadlinesInitialState extends HeadlinesState {
  @override
  List<Object> get props => [];
}

class HeadlinesLoadingState extends HeadlinesState{
  @override
  List<Object> get props => [];
}

class HeadlinesLoadedState extends HeadlinesState{
  final List<Article> headlines;

  HeadlinesLoadedState(this.headlines);

  @override
  List<Object> get props => [headlines];

}
