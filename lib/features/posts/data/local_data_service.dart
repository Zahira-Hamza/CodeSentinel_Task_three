import 'models/post_model.dart';

class LocalDataService {
  static List<PostModel> getFallbackPosts() {
    return [
      PostModel(
        userId: 1,
        id: 1,
        title: "Sample Post 1",
        body:
            "This is a sample post content. The API might be temporarily unavailable.",
      ),
      PostModel(
        userId: 1,
        id: 2,
        title: "Sample Post 2",
        body:
            "Another sample post. Please check your internet connection and try again.",
      ),
      PostModel(
        userId: 2,
        id: 3,
        title: "Sample Post 3",
        body:
            "This is fallback data showing how the app would display real posts.",
      ),
    ];
  }
}
