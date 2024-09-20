import 'package:test_2/api/api.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/api_const.dart';
import 'package:test_2/model/signup.dart';
import 'package:test_2/model/student.dart';
import 'package:test_2/service/signup_service.dart';
import 'package:test_2/service/student_service.dart';

class StudentsServiceImpl extends StudentsService{
 

Api api=Api();
  @override
  Future<ApiResponse> savestudents(Signup students)async {
    ApiResponse res=await api.post(baseUrl+createUserApi, students.toJson());
  return res;
  }
  
@override
  Future<ApiResponse> getStudents()async{
    ApiResponse response=await api.get(baseUrl+getstudentsApi);
    return response;
  }
  
 
 
  }