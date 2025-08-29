import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'models/post_model.dart';

class ApiService {
  // Option 1: JSONPlaceholder (Latin text)
  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Option 2: DummyJSON (English text)
  static const String baseUrl = 'https://dummyjson.com';

  static const int timeoutSeconds = 30;

  Future<List<PostModel>> fetchPosts() async {
    try {
      // For DummyJSON, the endpoint is different
      final response = await http.get(
        Uri.parse('$baseUrl/posts'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: timeoutSeconds));

      if (kDebugMode) {
        print('API Response: ${response.body.substring(0, 100)}...');
      }

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        // Handle different response structures
        if (baseUrl == 'https://jsonplaceholder.typicode.com') {
          // JSONPlaceholder structure
          final List<dynamic> postsList = data;
          return postsList.map((json) => PostModel.fromJson(json)).toList();
        } else {
          // DummyJSON structure
          final List<dynamic> postsList = data['posts'];
          return postsList.map((json) => PostModel.fromJson(json)).toList();
        }
      } else {
        throw Exception(
            'Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
