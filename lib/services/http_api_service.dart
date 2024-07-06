import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpApiService {
  final String baseUrl;

  HttpApiService({
    required this.baseUrl,
  });

  // Definicion REST del GET
  Future<Map<String, dynamic>?> get({
    required String endpoint,
  }) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  // Definicion REST del POST
  Future<Map<String, dynamic>?> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(data),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  // Definicion REST del PUT
  Future<Map<String, dynamic>?> put({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  // Definicion REST del DELETE
  Future<bool> delete({
    required String endpoint,
  }) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));

    return response.statusCode == 200;
  }
}
