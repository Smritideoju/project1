import 'package:test_2/api_response/api_response.dart';

abstract class ProductService {
  Future<ApiResponse> getProducts();
}
