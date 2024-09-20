import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/model/assignment.dart';
import 'package:test_2/view/assignment.dart';

abstract class AssignmentService{
  Future<ApiResponse> setAssignment(assignmentModel assignmentmodel);
}