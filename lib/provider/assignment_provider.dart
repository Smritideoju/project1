import 'package:flutter/material.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/assignment.dart';
import 'package:test_2/service/assignment_service.dart';
import 'package:test_2/service/assignment_service_impl.dart';

class AssignmentProvider extends ChangeNotifier {
  String? subjectName, semester, faculty, title, description;
  AssignmentService assignmentService = AssignmentServiceImpl();
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

  List<String> subjectNameList = [
    "English",
    "Mathematics",
    "Operating System",
    "C++"
  ];
  StatusUtils setAssigStatus = StatusUtils.none;

  setAssign(StatusUtils status) {
    setAssigStatus = StatusUtils.loading;
    notifyListeners();
  }

  Future<void> saveAssignment() async {
    if (setAssigStatus != StatusUtils.loading) {
      setAssign(StatusUtils.loading);
    }
    assignmentModel assignmentmodel = assignmentModel(
        subjectName: subjectName,
        semester: semester,
        faculty: faculty,
        title: title,
        description: description);

    ApiResponse response =await assignmentService.setAssignment(assignmentmodel);
    if(response.statusUtils==StatusUtils.success){
      setAssign(StatusUtils.success);
    }else if(response.statusUtils==StatusUtils.error){
  setAssign(StatusUtils.error);
  }
}
}