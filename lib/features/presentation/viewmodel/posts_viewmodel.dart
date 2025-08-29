import 'package:flutter/foundation.dart';

import '../../posts/data/api_services.dart';
import '../../posts/data/local_data_service.dart';
import '../../posts/data/models/post_model.dart';

class PostsViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<PostModel> _posts = [];
  bool _isLoading = false;
  String _error = '';
  bool _usingFallbackData = false;

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get usingFallbackData => _usingFallbackData;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _error = '';
    _usingFallbackData = false;
    notifyListeners();

    try {
      final fetchedPosts = await _apiService.fetchPosts();
      _posts = fetchedPosts;
    } catch (e) {
      _error = e.toString();

      // Use fallback data if API fails
      _posts = LocalDataService.getFallbackPosts();
      _usingFallbackData = true;

      // For debugging, print the error to console
      if (kDebugMode) {
        print('Error fetching posts: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
