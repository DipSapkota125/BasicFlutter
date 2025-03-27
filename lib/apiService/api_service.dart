import 'package:calculater_app/productModel/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _configureDio();
  }

  void _configureDio() {
    // Load environment variables
    final apiUrl = dotenv.env['DEV_API_URL'] ?? 'https://default-api-url.com';
    _dio.options.baseUrl = apiUrl;

    // Adding the interceptor to handle token management
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = 'your_token_here';

          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            print('Token expired. Please refresh the token.');
          }
          return handler.next(e);
        },
      ),
    );
  }

  // Method to fetch products
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('');
      List<Product> products =
          (response.data as List)
              .map((item) => Product.fromJson(item))
              .toList();
      return products;
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
