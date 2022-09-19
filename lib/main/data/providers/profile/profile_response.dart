import 'package:code_union_test/core/api/api_response.dart';
import 'package:code_union_test/main/domain/models/profile/user.dart';
import 'package:http/http.dart';

class ProfileResponse extends ApiResponse {
  final User? user;

  const ProfileResponse({
    this.user,
    bool isSuccess = false,
    int? statusCode,
    Response? response,
    String? error,
  }) : super(isSuccess: isSuccess, statusCode: statusCode, response: response, error: error);
}
