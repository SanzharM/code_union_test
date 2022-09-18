import 'dart:convert';

import 'package:code_union_test/core/api/api.dart';
import 'package:code_union_test/core/api/endpoints.dart';
import 'package:code_union_test/main/data/app_provider.dart';
import 'package:code_union_test/main/data/providers/feed/feed_response.dart';
import 'package:code_union_test/main/domain/models/feed/post.dart';
import 'package:flutter/foundation.dart';

class FeedProvider extends AppProvider {
  Future<PostsResponse> getFeed({required int page, int perPage = 10}) async {
    final response = await api.request(
      route: Uri.http(
        ApiEndpoints.host,
        ApiEndpoints.getFeed,
        page == 1 ? null : {'page': page, 'perPage': perPage},
      ),
      method: Method.get,
      needToken: true,
    );

    return PostsResponse(
      posts: response.isSuccess ? await compute(_parsePosts, response.response?.body) : null,
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      response: response.response,
      error: response.isSuccess ? null : response.error,
    );
  }

  List<Post>? _parsePosts(String? body) {
    if (body?.isEmpty ?? true) return null;
    try {
      final rawData = jsonDecode(body!) as Map<String, dynamic>;
      return (rawData['restaurants'] as List).map<Post>((e) => Post.fromMap(e)).toList();
    } catch (e) {
      debugPrint('Error parsing posts: $e');
      return null;
    }
  }
}
