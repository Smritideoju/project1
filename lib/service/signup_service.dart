import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/model/signup.dart';

abstract class StudentsService{
  Future<ApiResponse> savestudents(Signup student);
  Future<ApiResponse> getStudents();
}