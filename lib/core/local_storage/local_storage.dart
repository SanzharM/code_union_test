import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final _storage = const FlutterSecureStorage();
  static const _accessTokenKey = 'CodeUnionAccessTokenKey';
  static const _refreshTokenKey = 'CodeUnionRefreshTokenKey';

  FlutterSecureStorage get storage => _storage;

  Future<String?> getAccessToken() async => await _storage.read(key: _accessTokenKey);

  Future<String?> getRefreshToken() async => await _storage.read(key: _refreshTokenKey);

  Future<void> setAccessToken(String? token) async {
    if (token?.isEmpty ?? true) {
      return await _storage.delete(key: _accessTokenKey);
    }
    return await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<void> setRefreshToken(String? token) async {
    if (token?.isEmpty ?? true) {
      return await _storage.write(key: _refreshTokenKey, value: token);
    }
    return await _storage.write(key: _refreshTokenKey, value: token);
  }

  Future<void> resetStorage() async => await _storage.deleteAll();
}
