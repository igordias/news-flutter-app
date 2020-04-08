part of 'headlines_bloc.dart';

abstract class HeadlinesEvent extends Equatable {
  HeadlinesEvent();
}

class GetHeadlinesForCountry extends HeadlinesEvent {
  final String countryCode;

  @override
  List<Object> get props => [countryCode];

  GetHeadlinesForCountry(this.countryCode);
}
