import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:samarinda_santer/models/api_return_value.dart';
import 'package:samarinda_santer/modules/services/http/http.dart';

class HttpAuthService {
  static Future<ApiReturnValue> post({required String path, Map<String, dynamic>? body}) async {
    var staticValue = HttpService.apiLink;
    var statiPath = HttpService.path;
    Uri link = Uri.https(staticValue, '$statiPath$path');
    ;
    try {
      var request = await http
          .post(
            link,
            headers: await HttpService().header(useToken: false),
            body: body,
          )
          .timeout(HttpService.timeout);

      var response = await HttpService().handleResponse(response: request, url: link.toString(), isAuth: true);

      if (response.value == null) {
        return ApiReturnValue.failure(response.message!);
      }

      return ApiReturnValue(value: response.value['result']);
    } on TimeoutException {
      return ApiReturnValue.failure('Request Timeout',
          errorLog: 'Request Timeout (25 seconds)', statusCode: 500, url: link.toString());
    } catch (e) {
      return ApiReturnValue.failure(e.toString(), errorLog: e.toString(), statusCode: 500, url: link.toString());
    }
  }
}
