class WrappedError {
  final Exception _exception;
  final Function _retryAction;

  WrappedError(this._exception, this._retryAction);

  Exception get exception => _exception;
  Function get retryAction => _retryAction; 
}
