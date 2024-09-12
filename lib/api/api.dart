import 'package:dio/dio.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/helper.dart';
import 'package:test_2/core/status_util.dart';

class Api {
  Dio dio = Dio();
  post(String url, var value) async {
     if(await isInternetAvailable()==true){
 try {
     
      Response res = await dio.post(url, data: value);
      if (res.statusCode == 200 || res.statusCode == 201) {
        ApiResponse apiResponse =
            ApiResponse(statusUtils: StatusUtils.success, data: res.data);
        return apiResponse;
      }
    } catch (e) {
      print(e);
      ApiResponse apiResponse = ApiResponse(
          statusUtils: StatusUtils.error, errorMessage: e.toString());
      return apiResponse;
    }
      }
     else {return ApiResponse(statusUtils: StatusUtils.error,errorMessage:"noInternetConnection");
     }
  }

  get(String url) async {
    if(await isInternetAvailable()==true){
    try {
      Response res = await dio.get(url);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse(statusUtils: StatusUtils.success, data: res.data);
      }
    } catch (e) {
      print(e);
      return ApiResponse(
          statusUtils: StatusUtils.error, errorMessage: e.toString());
    }
  }else {return ApiResponse(statusUtils: StatusUtils.error,errorMessage:"noInternetConnection");
     }
  }
}
