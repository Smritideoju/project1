import 'package:flutter/material.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/teachermodel.dart';
import 'package:test_2/service/teacher_impl.dart';
import 'package:test_2/service/teacher_service.dart';

class TeacherProvider extends ChangeNotifier {
  List<String> genderList = ["Male", "Female", "others"];
  String? name, address, contact, password, email, gender;
  TeacherService teacherService = TeacherServiceImpl();

  StatusUtils saveTeacherStatus = StatusUtils.none;
  StatusUtils  getTeacherStatus= StatusUtils.none;

 setStatus(StatusUtils status) {
    getTeacherStatus = status;
    notifyListeners();
  }


  setsaveTeacherStatus(StatusUtils status) {
    saveTeacherStatus = status;
    notifyListeners();
  }

  saveTeacherData() async {
    if(saveTeacherStatus!=StatusUtils.loading){
      setsaveTeacherStatus(StatusUtils.loading);
    }
    Teacher teacher = Teacher(
        name: name,
        address: address,
        contact: contact,
        password: password,
        gender: gender);

    ApiResponse response = await teacherService.saveTeacherData(teacher);
    if (response.statusUtils == StatusUtils.success) {
      setsaveTeacherStatus(StatusUtils.success);
    } else if (response.statusUtils == StatusUtils.error) {
      setsaveTeacherStatus(StatusUtils.error);
    }
  }

getTeacherData() async {
  if(getTeacherStatus!=StatusUtils.loading){
    setStatus(StatusUtils.loading);
  }
  ApiResponse response=await teacherService.getTeacherData();
  if(response.statusUtils==StatusUtils.success);
  setStatus(StatusUtils.success);

    }
}

