import 'package:test_2/api/api.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/api_const.dart';
import 'package:test_2/service/product_service.dart';

class ProductServiceImpl extends ProductService {
  Api api = Api();

  @override
  Future<ApiResponse> getProducts() async {
    ApiResponse response = await api.get(baseUrl + getproductApi);
    return response;
  }
}
