import 'package:dio/dio.dart';

class DioApiService {
  final Dio _dio;

// Constructor del servicio
  DioApiService({
    required baseUrl,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        );

// Funcion placeholder, para definir futuras implementaciones
  Future<Response> getPosts() async {
    try {
      final response = await _dio.get('/posts');
      return response;
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
