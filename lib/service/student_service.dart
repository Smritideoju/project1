

import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/model/student.dart';

abstract class StudentService{
  Future<ApiResponse> savestudent(Student student);
  Future<ApiResponse> getStudents();
}