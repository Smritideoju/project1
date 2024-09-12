import 'package:test_2/api/api.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/api_const.dart';
import 'package:test_2/model/student.dart';
import 'package:test_2/service/student_service.dart';

class StudentServiceImpl extends StudentService{
 

Api api=Api();
  @override
  Future<ApiResponse> savestudent(Student student)async {
    ApiResponse res=await api.post(baseUrl+postStudentApi, student.toJson());
  return res;
  }
  
@override
  Future<ApiResponse> getStudents()async{
    ApiResponse response=await api.get(baseUrl+getstudentsApi);
    return response;
  }
  }