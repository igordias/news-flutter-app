part of 'error_bloc.dart';

abstract class ErrorEvent extends Equatable {
  const ErrorEvent();
}

class ErrorThrownEvent extends ErrorEvent {
  final RequestException exception;

  ErrorThrownEvent(this.exception);
  
  @override
  List<Object> get props => [exception];
}