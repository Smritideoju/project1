import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/service/loginservice.dart';
import 'package:test_2/service/loginservice_impl.dart';

class LoginProvider extends ChangeNotifier{


String? email,password;
LoginService loginService=LoginServiceImpl();
StatusUtils setLoginStatus=StatusUtils.none;

setLogin(StatusUtils status){
  setLoginStatus=status;
notifyListeners();
}

Future<void>saveLogin()async{
if(setLoginStatus!=StatusUtils.loading){
  setLogin(StatusUtils.loading);
}
ApiResponse response=await loginService.getLogin(email!,password!);
if(response.statusUtils==StatusUtils.success){
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token',response.data["token"]);
  setLogin(StatusUtils.success);
}else if(response.statusUtils==StatusUtils.error){
  setLogin(StatusUtils.error);
}
}}