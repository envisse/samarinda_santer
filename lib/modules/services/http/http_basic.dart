import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:samarinda_santer/models/api_return_value.dart';
import 'package:samarinda_santer/modules/services/http/http.dart';

class HttpBasicService {
  static Future<ApiReturnValue> get({required String path, Map<String, dynamic>? query}) async {
    var staticValue = HttpService.apiLink;
    var statiPath = HttpService.path;
    Uri link = Uri.http(staticValue, '$statiPath$path');
    try {
      var request = await http
          .get(
            link,
            headers: await HttpService().header(useToken: true),
          )
          .timeout(HttpService.timeout);

      return HttpService().handleResponse(response: request, url: link.toString());
    } on TimeoutException {
      return ApiReturnValue.failure('Request Timeout',
          errorLog: 'Request Timeout (30 seconds)', statusCode: 500, url: link.toString());
    } catch (e) {
      return ApiReturnValue.failure('Unknown Error', errorLog: e.toString(), statusCode: 500, url: link.toString());
    }
  }

  static Future<ApiReturnValue> post({required String path, Object? body, bool sendLog = true}) async {
    var staticValue = HttpService.apiLink;
    var statiPath = HttpService.path;
    Uri link = Uri.http(staticValue, '$statiPath$path');
    
    try {
      var request = await http
          .post(
            link,
            headers: await HttpService().header(useToken: true),
            body: json.encode(body),
          )
          .timeout(HttpService.timeout);

      return HttpService().handleResponse(response: request, url: link.toString());
    } on Exception catch (e) {
      return ApiReturnValue.failure('Unknown Error', errorLog: e.toString(), statusCode: 500, url: link.toString());
    }
  }

  static Future<ApiReturnValue> patch({required String path, required String id, Object? body}) async {
    var staticValue = HttpService.apiLink;
    Uri link = Uri.http(staticValue, '$path/$id');
    try {
      var request = await http
          .put(
            link,
            headers: await HttpService().header(useToken: true),
            body: json.encode(body),
          )
          .timeout(HttpService.timeout);

      return HttpService().handleResponse(response: request, url: link.toString());
    } on TimeoutException {
      return ApiReturnValue.failure('Request Timeout',
          errorLog: 'Request Timeout (30 seconds)', statusCode: 500, url: link.toString());
    } catch (e) {
      return ApiReturnValue.failure('Unknown Error', errorLog: e.toString(), statusCode: 500, url: link.toString());
    }
  }
}
