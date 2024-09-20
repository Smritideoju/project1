import 'package:flutter/material.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/signup.dart';
import 'package:test_2/model/student.dart';
import 'package:test_2/service/signup_service.dart';
import 'package:test_2/service/signup_service_impl.dart';
import 'package:test_2/service/student_service.dart';
import 'package:test_2/service/student_service_impl.dart';

class SignupProvider extends ChangeNotifier {
  List<Student> studentList = [];
  List<String> genderList = ["Male", "Female", "others"];
 List<String> roleList=["admin","user"];
  
  String? username,
       name,
      contact,
      email,
      password,
      gender,
      role,
      submit;
  StudentsService studentsService = StudentsServiceImpl();

  StatusUtils saveUserStatus = StatusUtils.none;
  StatusUtils getUserStatus = StatusUtils.none;

  get firebaseStatus => null;
  setUserStatus1(StatusUtils status) {
    getUserStatus = status;
    notifyListeners();
  }

  setUserStatus(StatusUtils status) {
    saveUserStatus = status;
    notifyListeners();
  }

  Future<void> saveUser() async {
    if (saveUserStatus != StatusUtils.loading) {
      setUserStatus(StatusUtils.loading);
    }

    Signup signup = Signup(
        name: name,
        gender: gender,
        contact: contact,
        email: email,
        password: password,
        username:username,
        role:role
        );
    ApiResponse response = await studentsService.savestudents(signup);
    if (response.statusUtils == StatusUtils.success) {
      setUserStatus(StatusUtils.success);
    } else if (response.statusUtils == StatusUtils.error) {
      setUserStatus(StatusUtils.error);
    }
  }

 

}
