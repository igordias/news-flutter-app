part of 'error_bloc.dart';

abstract class ErrorState extends Equatable {
  const ErrorState();
}

class ErrorInitial extends ErrorState {
  @override
  List<Object> get props => [];
}

class ErrorDisplayState extends ErrorState {
  final String title;
  final String message;
  final bool isDismissible;

  ErrorDisplayState(this.title, this.message, this.isDismissible);

  @override
  List<Object> get props => [title, message, isDismissible];
}

class ErrorDismissed extends ErrorState {
  @override
  List<Object> get props => null;
}
