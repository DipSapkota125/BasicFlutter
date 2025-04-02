import 'dart:developer';

import 'package:calculater_app/productModel/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio = Dio();
  static final ApiService _instance = ApiService._internal();

  // Factory constructor to return the same instance
  factory ApiService() {
    return _instance;
  }

  // Private constructor
  ApiService._internal() {
    _configureDio();
  }

  void _configureDio() {
    try {
      final apiUrl =
          dotenv.env['FLUTTER_DEV_API_URL'] ??
          'https://fakestoreapi.com/products';
      _dio.options.baseUrl = apiUrl;

      log('API URL configured: $apiUrl');

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
              log('Token expired. Please refresh the token.');
            }
            return handler.next(e);
          },
        ),
      );
    } catch (e) {
      log('Error configuring Dio: $e');
      // Set a default URL if dotenv fails
      _dio.options.baseUrl = 'https://fakestoreapi.com/products';
    }
  }

  // Method to fetch products
  Future<List<Product>> getProducts() async {
    try {
      log('Making API request to: ${_dio.options.baseUrl}');
      final response = await _dio.get('');
      List<Product> products =
          (response.data as List)
              .map((item) => Product.fromJson(item))
              .toList();
      return products;
    } catch (e) {
      log('Error fetching products: $e');
      throw Exception('Failed to load products: $e');
    }
  }
}
