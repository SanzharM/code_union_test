import 'package:code_union_test/core/api/api_response.dart';
import 'package:code_union_test/main/domain/models/feed/post.dart';
import 'package:http/http.dart';

class PostsResponse extends ApiResponse {
  final List<Post>? posts;
  PostsResponse({
    this.posts,
    bool isSuccess = false,
    int? statusCode,
    Response? response,
    String? error,
  }) : super(isSuccess: isSuccess, statusCode: statusCode, response: response, error: error);
}
