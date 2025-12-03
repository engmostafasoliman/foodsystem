import 'package:foodsystem/core/networking/api_error_handler.dart';
import 'package:foodsystem/core/networking/api_result.dart';
import 'package:foodsystem/core/networking/api_service.dart';
import 'package:foodsystem/features/signup/data/models/sign_up_request_body.dart';
import 'package:foodsystem/features/signup/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo({required this.apiService});

  Future<ApiResult<SignUpResponse>> signup(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
