import 'package:test_2/api_response/api_response.dart';

abstract class LoginService{
  Future<ApiResponse> getLogin(String email, String password);
}