import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';

import 'package:test_2/model/form.dart';
import 'package:test_2/service/firebase_formservice.dart';

class FirebaseFormServiceImpl extends FirebaseFormService {
  @override
  Future<ApiResponse> submitValue(User user) async {
    if (await isInternetAvailable()) {
      try {
        await FirebaseFirestore.instance
            .collection("student")
            .add(user.toJson());

        return ApiResponse(statusUtils: StatusUtils.success);
      } catch (e) {
        print(e);
        return ApiResponse(
            statusUtils: StatusUtils.error, errorMessage: e.toString());
      }
    } else {
      return ApiResponse(
          statusUtils: StatusUtils.error, errorMessage: "noInternetConnection");
    }
  }

  @override
  Future<ApiResponse> getValue() async {
    if (await isInternetAvailable()) {
      try {
        var data = await FirebaseFirestore.instance.collection("student").get();
        List<User> userList = [];
        userList
            .addAll(data.docs.map(((e) => User.fromJson(e.data()))).toList());
        for (int i = 0; i < userList.length; i++) {
          userList[i].id = data.docs[i].id;
        }
        print(userList);
        return ApiResponse(statusUtils: StatusUtils.success, data: userList);
      } catch (e) {
        print(e);
        return ApiResponse(
            statusUtils: StatusUtils.error, errorMessage: e.toString());
      }
    } else {
      return ApiResponse(
          statusUtils: StatusUtils.error, errorMessage: "noInternetConnection");
    }
  }

  @override
  Future<ApiResponse> deleteStudentById(String id) async {
    try {
      await FirebaseFirestore.instance.collection("student").doc(id).delete();
      return ApiResponse(statusUtils: StatusUtils.success);
    } catch (e) {
      print(e);
      return ApiResponse(
          statusUtils: StatusUtils.error, errorMessage: e.toString());
    }
  }
}
