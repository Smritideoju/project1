import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/form.dart';



abstract class FirebaseFormService {
    Future<ApiResponse> submitValue(User user) ;
   Future<ApiResponse> getValue();
   Future<ApiResponse> deleteStudentById(String id);
}

