import 'package:flutter/material.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/student.dart';
import 'package:test_2/service/student_service.dart';
import 'package:test_2/service/student_service_impl.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> studentList = [];
  List<String> genderList = ["Male", "Female", "others"];
  List<String> facultyList = ["BIM", "BCA", "CSIT"];
  List<String> semseterList = [
    "1st sem",
    "2nd sem",
    "3rd sem",
    "4th sem",
    "5th sem",
    "6th sem",
    "7th sem",
    "8th sem"
  ];
  String? name,
      address,
      contact,
      email,
      password,
      gender,
      faculty,
      semester,
      submit;
  StudentService studentService = StudentServiceImpl();

  StatusUtils saveUserStatus = StatusUtils.none;
  StatusUtils getUserStatus = StatusUtils.none;
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

    Student student = Student(
        name: name,
        address: address,
        gender: gender,
        contact: contact,
        email: email,
        password: password,
        semester: semester,
        faculty: faculty);
    ApiResponse response = await studentService.savestudent(student);
    if (response.statusUtils == StatusUtils.success) {
      setUserStatus(StatusUtils.success);
    } else if (response.statusUtils == StatusUtils.error) {
      setUserStatus(StatusUtils.error);
    }
  }

  Future<void> getUser() async {
    if (getUserStatus != StatusUtils.loading) {
      setUserStatus(StatusUtils.loading);
    }
    ApiResponse response = await studentService.getStudents();
    if (response.statusUtils == StatusUtils.success) {
      studentList.addAll(
          (response.data['list']as List<dynamic>).map((e) => Student.fromJson(e)).toList());
      print(studentList);
      setUserStatus1(StatusUtils.success);
    } else if (response.statusUtils == StatusUtils.error) {
      setUserStatus1(StatusUtils.error);
    }
  }
}
