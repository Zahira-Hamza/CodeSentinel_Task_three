// class PostModel {
//   final int userId;
//   final int id;
//   final String title;
//   final String body;
//
//   PostModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });
//
//   factory PostModel.fromJson(Map<String, dynamic> json) {
//     return PostModel(
//       userId: json['userId'] ?? 1, // Default value if null
//       id: json['id'] ?? 0, // Default value if null
//       title: json['title'] ?? 'No Title',
//       body: json['body'] ??
//           json['content'] ??
//           'No Content', // Handle different field names
//     );
//   }
// }
class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? 1,
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      body: json['body'] ?? 'No Content',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
