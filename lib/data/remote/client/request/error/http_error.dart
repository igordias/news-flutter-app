enum HttpErrorType {
  BAD_REQUEST,
  UNAUTHORIZED,
  PAYMENT_REQUIRED,
  METHOD_NOT_ALLOWED,
  FORBIDDEN,
  NOT_FOUND,
  TIMEOUT,
  CONFLICT,
  UN_PROCESSABLE_ENTITY,
  INTERNAL_SERVER_ERROR,
  BAD_GATEWAY,
  SERVICE_UNAVAILABLE,
  UNEXPECTED_ERROR
}

extension HttpErrorTypeExtension on HttpErrorType {

  static HttpErrorType fromCode(int code) {
    switch (code) {
      case 400:
        return HttpErrorType.BAD_REQUEST;
      case 401:
        return HttpErrorType.UNAUTHORIZED;
      case 402:
        return HttpErrorType.PAYMENT_REQUIRED;
      case 403:
        return HttpErrorType.FORBIDDEN;
      case 405:
        return HttpErrorType.METHOD_NOT_ALLOWED;
      case 404:
        return HttpErrorType.NOT_FOUND;
      case 408:
        return HttpErrorType.TIMEOUT;
      case 409:
        return HttpErrorType.CONFLICT;
      case 422:
        return HttpErrorType.UNAUTHORIZED;
      case 500:
        return HttpErrorType.INTERNAL_SERVER_ERROR;
      case 502:
        return HttpErrorType.BAD_GATEWAY;
      case 503:
        return HttpErrorType.SERVICE_UNAVAILABLE;
      default:
        return HttpErrorType.UNEXPECTED_ERROR;
    }
  }
}
