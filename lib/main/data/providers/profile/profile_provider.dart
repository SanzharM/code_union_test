import 'dart:convert';

import 'package:code_union_test/core/api/api.dart';
import 'package:code_union_test/core/api/endpoints.dart';
import 'package:code_union_test/main/data/app_provider.dart';
import 'package:code_union_test/main/data/providers/profile/profile_response.dart';
import 'package:code_union_test/main/domain/models/profile/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider extends AppProvider {
  Future<ProfileResponse> getProfile() async {
    final response = await api.request(
      route: Uri.http(ApiEndpoints.host, ApiEndpoints.getProfile),
      method: Method.get,
      needToken: true,
    );

    return ProfileResponse(
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      user: response.isSuccess ? await compute(_parseUser, response.response?.body) : null,
      response: response.response,
      error: response.isSuccess ? null : response.error,
    );
  }

  User? _parseUser(String? body) {
    if (body?.isEmpty ?? true) return null;
    try {
      final rawData = jsonDecode(body!) as Map<String, dynamic>;
      return User.fromMap(rawData);
    } catch (e) {
      debugPrint('Unable to parse user: $e');
      return null;
    }
  }
}
