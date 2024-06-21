//List Local Storage

//access_token = token logged in user profile

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  //ACCESS TOKEN
  static Future<String?> getAccessToken() async {
    return await _LocalStorageService().read('access_token');
  }

  static Future<void> setAccessToken(dynamic value) async {
    return _LocalStorageService().write('access_token', value);
  }

  static Future<void> deleteAccessToken() async {
    return _LocalStorageService().delete('access_token');
  }
}

class _LocalStorageService {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future write(String key, String value) async {
    return _storage.write(key: key, value: value);
  }

  Future read(String key) {
    return _storage.read(key: key);
  }

  Future delete(String key) {
    return _storage.delete(key: key);
  }
}
