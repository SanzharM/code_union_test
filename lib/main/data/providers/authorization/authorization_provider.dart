import 'package:code_union_test/core/api/api.dart';
import 'package:code_union_test/core/api/endpoints.dart';
import 'package:code_union_test/main/data/app_provider.dart';
import 'package:code_union_test/main/domain/models/authorization/login_credentials.dart';
import 'package:code_union_test/main/domain/models/authorization/registration_credentials.dart';
import 'package:flutter/cupertino.dart';

import 'authorization_response.dart';

class AuthorizationProvider extends AppProvider {
  Future<AuthorizationResponse> login(LoginCredentials credentials) async {
    final response = await api.request(
      route: Uri.http(ApiEndpoints.host, ApiEndpoints.login),
      method: Method.post,
      params: credentials.toMap(),
    );

    return AuthorizationResponse(
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      response: response.response,
      error: response.isSuccess ? null : response.error,
    );
  }

  Future<dynamic> registration(RegistrationCredentials credentials) async {
    final response = await api.request(
      route: Uri(host: ApiEndpoints.host, path: ApiEndpoints.registration),
      method: Method.post,
      params: credentials.toMap(),
    );

    if (response.isSuccess) {
      return response;
    }
    return response;
  }

  Future<bool> saveTokens(String? accessToken, String? refreshToken) async {
    try {
      await storage.setAccessToken(accessToken);
      await storage.setRefreshToken(refreshToken);
      return true;
    } catch (e) {
      debugPrint('Unable to saveTokens: $e');
      return false;
    }
  }
}
