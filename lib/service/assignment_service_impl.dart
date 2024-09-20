
import 'package:test_2/api/api.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/api_const.dart';
import 'package:test_2/model/assignment.dart';
import 'package:test_2/service/assignment_service.dart';
import 'package:test_2/view/assignment.dart';

class AssignmentServiceImpl extends AssignmentService{
 
  
  @override
  Future<ApiResponse> setAssignment(assignmentModel assignmentmodel)async {
    Api api=Api();
   ApiResponse response=await  api.post(baseUrl+assignmentApi,assignmentmodel.toJson());
   return response;
  }
  }
