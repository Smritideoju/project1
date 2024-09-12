import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/teachermodel.dart';
import 'package:test_2/service/teacher_service.dart';

class TeacherServiceImpl extends TeacherService {
  @override
  Future<ApiResponse> saveTeacherData(Teacher teacher) async {
    try {
      await FirebaseFirestore.instance
          .collection("HTable")
          .add(teacher.toJson());
      return ApiResponse(statusUtils: StatusUtils.success);
    } catch (e) {
      print(e);

      return ApiResponse(
          statusUtils: StatusUtils.error, errorMessage: e.toString());
    }
  }
  
  @override
  Future<ApiResponse> getTeacherData()async {
  try{
    await FirebaseFirestore.instance.collection("HTable").get().then((value){
List<Teacher>datas=[];
datas.addAll(value.docs.map((e) => Teacher.fromJson(e.data())).toList());
print(datas);


  return ApiResponse(statusUtils: StatusUtils.success,data: datas);
    });
      return ApiResponse(statusUtils: StatusUtils.success);
  }catch(e) {
      print(e);
        return ApiResponse(statusUtils: StatusUtils.error);
    
  }

    }
  }

