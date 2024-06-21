class ApiReturnValue<T> {
  T? value;
  final String? message;
  final String? errorLog;
  final int? statusCode;
  final String? url;

  ApiReturnValue({this.message, this.value, this.errorLog, this.url, this.statusCode});

  factory ApiReturnValue.failure(String message, {String? errorLog, int? statusCode, String? url}) {
    return ApiReturnValue(
      value: null,
      message: message == '' ? 'Error, Try Again' : message,
      errorLog: errorLog,
      statusCode: statusCode,
      url: url ?? '',
    );
  }

  factory ApiReturnValue.success(T? value) {
    return ApiReturnValue(
      value: value,
      message: null,
    );
  }

  ApiReturnValue<T> copyWith({T? value, String? message}) {
    return ApiReturnValue<T>(value: value ?? this.value, message: message ?? this.message);
  }
}
