import 'package:test_2/api/api.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/api_const.dart';
import 'package:test_2/model/student.dart';
import 'package:test_2/service/loginservice.dart';

class LoginServiceImpl extends LoginService{
  @override
  Future<ApiResponse> getLogin(String email,password) async{
   Api api=Api();
   var json={
    "email":email,
    "password":password};
    ApiResponse res=await api.post(baseUrl+loginApi, json);
  return res;
  }
  }
  


