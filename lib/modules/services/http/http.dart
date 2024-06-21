import 'dart:convert';
import 'package:http/http.dart';
import 'package:samarinda_santer/models/api_return_value.dart';

class HttpService {
  //MAXIMUM OF DURATION TO HIT API
  static const Duration timeout = Duration(seconds: 25); //25 seconds

  static String apiLink = 'api.samarindakota.go.id';

  static String path = '/ppid-samarinda';

  static String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJiMTljM2JmODFmYTQ5MmQ4NTM3Y2ZlMjcwYjhhZDc4MDZkNjI3NTNjZjk5ZGZlOTY4MWIzNjI1ZDNjMTdiNGIyZTk4OWYyNTQyYjYyOWVjIn0.eyJhdWQiOiIzIiwianRpIjoiMmIxOWMzYmY4MWZhNDkyZDg1MzdjZmUyNzBiOGFkNzgwNmQ2Mjc1M2NmOTlkZmU5NjgxYjM2MjVkM2MxN2I0YjJlOTg5ZjI1NDJiNjI5ZWMiLCJpYXQiOjE3MTg5NDc1MzEsIm5iZiI6MTcxODk0NzUzMSwiZXhwIjoxNzUwNDgzNTMxLCJzdWIiOiI4MjAiLCJzY29wZXMiOlsibW9ub2dyYWZpLWtlY2FtYXRhbiIsIm1vbm9ncmFmaS1rZWx1cmFoYW4iLCJwdXNrZXNtYXMiLCJiZXJpdGFwYXJpd3N0YSIsImFnZW5kYSIsInBlbmd1bXVtYW4iLCJwZW5naGFyZ2FhbiJdfQ.O8-9H9aY9vyHU7CTFCpVx24UvHJmQEcn_xiHNQne2v1X15BMloWfjMH8AzRbyrkDLTNvBUhqTibZQjBzupw4tFGl6oUVgTB6ppzjuC-GJN9txcGGugXjJCkF2d8XKtN_c8nNUUIGHFMPHs7Jx2NNgSi6Qx6WTrJlUKijqjpPDBb_Rw-tGFo8jYwG9rpgh6nGXUF8ABe6oBYh9nTapcbP09iF1uwTAFv1M5JklIjTl9pkgXhtZo9O6QvjiCCGvnb2NZE-gibDvcF0dW_E8EELFAqMs1h5xPHl1Bo8qsuBmqvrnfkmpky0JmXiCq0zszDSxTo1cbBw9v3uv4xAQfPxnf7blTt9KWrLd6Wpj8Yu7fYS9hJzBr2BTPJtpG3UwZs9nisoWMgWut6roKazHFrGH8qWtKALQhTom3R-3Bj59-ucKIekVNaJ-LWRhZFye6fq0O0hXWoaNjamUFIpcjbIQTcLOs1nUJ_7yj9zT9XbyAz6WCj66ffE0T-9jnf3FospmFUTaDpw7kRIeNgF_YirD6Pbj39-wVuMA5Br4_cq4CZrUZuE7e23TbXpwXkhNPG3VJG_irnlbXi0HN-A2c9bdWnNlwfDIj6V-mPNUJBW7EQRGULiEhuBeJGVj4POv0bKwf7hWlnbmQkayPy4hntM1m2JJAoQEla7vaI3XO9k6EE';

  //Handle Response
  Future<ApiReturnValue> handleResponse({required Response response, required String url, bool? isAuth = false}) async {
    // log('$url  : ${response.statusCode.toString()}');
    switch (response.statusCode) {
      case (200):
        return ApiReturnValue.success(json.decode(response.body));
      case (404):
        return ApiReturnValue.failure(
          (json.decode(response.body)['message'] ?? 'Error Status Code : 404').toString(),
          errorLog: response.body.toString(),
          statusCode: response.statusCode,
          url: url,
        );
      case (422):
        if (isAuth == true) {
          return ApiReturnValue.failure('Invalid Username or Password');
        }
        return ApiReturnValue.failure(
          (json.decode(response.body)['message'] ?? 'Error Status Code : 422').toString(),
          errorLog: response.body.toString(),
          statusCode: response.statusCode,
          url: url,
        );
      case (401):
        if (isAuth == true) {
          return ApiReturnValue.failure('Invalid Username or Password');
        }
        return ApiReturnValue.failure(
          'Error Status Code : 401',
          errorLog: response.body.toString(),
          statusCode: response.statusCode,
          url: url,
        );
      case (500):
        return ApiReturnValue.failure(
          'Error Status Code : 500',
          errorLog: response.body.toString(),
          statusCode: response.statusCode,
          url: url,
        );
      default:
        return ApiReturnValue.failure(
          'Error Status Code : ${response.statusCode}',
          errorLog: response.body.toString(),
          statusCode: response.statusCode,
          url: url,
        );
    }
  }

  //HEADER
  Future<Map<String, String>> header({required bool useToken}) async {
    if (useToken == false) {
      return {
        'Accept': 'application/json',
      };
    }
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
  }
}
