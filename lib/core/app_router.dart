// import 'package:flutter/material.dart';
//
// import '../features/presentation/view/posts_screen.dart';
//
// class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/posts':
//         return MaterialPageRoute(builder: (_) => const PostsScreen());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ),
//         );
//     }
//   }
// }
import 'package:flutter/material.dart';

import '../features/presentation/view/post_details.dart';
import '../features/presentation/view/posts_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/posts':
        return MaterialPageRoute(builder: (_) => const PostsScreen());
      case '/postDetail':
        final post = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PostDetailScreen(
            title: post['title'],
            body: post['body'],
            userId: post['userId'],
            postId: post['id'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
