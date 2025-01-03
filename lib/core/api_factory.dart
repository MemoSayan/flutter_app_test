import 'package:dio/dio.dart';
import 'package:flutter_app_test/core/app_config.dart';


class ApiFactory {
  final Dio _dio;

  ApiFactory()
      : _dio = Dio(BaseOptions(
          baseUrl: AppConfig.instance.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ));

  Future<Response> getRequest(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  
}
