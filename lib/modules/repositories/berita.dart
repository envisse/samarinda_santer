



import 'package:samarinda_santer/models/api_return_value.dart';
import 'package:samarinda_santer/models/berita.dart';
import 'package:samarinda_santer/modules/services/http/http_basic.dart';

class BeritaRepositories {
  static String modul = 'Berita /berita_ppid';
  
  static Future<ApiReturnValue<List<Berita>?>> list() async {
    var response = await HttpBasicService.get(path: '/berita_ppid', query: {});

    if (response.value == null) {
      return ApiReturnValue(message: response.message);
    }

    List<dynamic> data = response.value['data'];

    List<Berita> listBerita = [];
    for (var value in data) {
      listBerita.add(Berita.listFromMap(value));
    }

    return ApiReturnValue(message: response.message, value: listBerita);
  }
}
