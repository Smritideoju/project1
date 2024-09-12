import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/model/teachermodel.dart';

abstract class TeacherService{
  Future<ApiResponse> saveTeacherData(Teacher teacher);
Future<ApiResponse>getTeacherData();
}