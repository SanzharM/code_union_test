import 'dart:convert';

import 'package:code_union_test/core/api/api.dart';
import 'package:code_union_test/core/api/endpoints.dart';
import 'package:code_union_test/main/data/app_provider.dart';
import 'package:code_union_test/main/domain/models/authorization/login_credentials.dart';
import 'package:code_union_test/main/domain/models/authorization/registration_credentials.dart';
import 'package:flutter/foundation.dart';

import 'authorization_response.dart';

class AuthorizationProvider extends AppProvider {
  Future<AuthorizationResponse> login(LoginCredentials credentials) async {
    final response = await api.request(
      route: Uri.http(ApiEndpoints.host, ApiEndpoints.login),
      method: Method.post,
      params: credentials.toMap(),
    );

    if (response.isSuccess) {
      final tokens = await compute(_parseTokens, response.response?.body);
      saveTokens(tokens['accessToken'], tokens['refreshToken']);
    }

    return AuthorizationResponse(
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      response: response.response,
      error: response.isSuccess ? null : response.error,
    );
  }

  Future<dynamic> registration(RegistrationCredentials credentials) async {
    final response = await api.request(
      route: Uri.http(ApiEndpoints.host, ApiEndpoints.registration),
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

  Map<String, String?> _parseTokens(String? body) {
    if (body?.isEmpty ?? true) return {};
    try {
      final rawJson = jsonDecode(body!) as Map<String, dynamic>;
      final tokens = <String, String>{};

      (rawJson['tokens'] as Map<String, dynamic>).forEach((key, value) {
        tokens.addAll({key: value.toString()});
      });
      return tokens;
    } catch (e) {
      debugPrint('Parsing tokens error: $e');
      return {};
    }
  }
}
