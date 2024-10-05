// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(
    this._dio,
  );
  final baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$baseUrl$endpoint');

    return response.data;
  }
}
