import 'package:code_union_test/core/api/api_response.dart';
import 'package:http/http.dart';

class AuthorizationResponse extends ApiResponse {
  AuthorizationResponse({
    bool isSuccess = false,
    int? statusCode,
    Response? response,
    String? error,
  }) : super(statusCode: statusCode, isSuccess: isSuccess, response: response, error: error);
}
