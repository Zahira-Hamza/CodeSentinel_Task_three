// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../viewmodel/posts_viewmodel.dart';
// import '../widgets/post_card.dart';
//
// class PostsScreen extends StatefulWidget {
//   const PostsScreen({super.key});
//
//   @override
//   State<PostsScreen> createState() => _PostsScreenState();
// }
//
// class _PostsScreenState extends State<PostsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Delay the API call to ensure the widget is properly mounted
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<PostsViewModel>(context, listen: false).fetchPosts();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Code Sentinel',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.deepPurple,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 4,
//       ),
//       body: Consumer<PostsViewModel>(
//         builder: (context, viewModel, child) {
//           // Show fallback data notice if using fallback
//           if (viewModel.usingFallbackData && viewModel.posts.isNotEmpty) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: const Text(
//                       'Showing sample data. API might be unavailable.'),
//                   backgroundColor: Colors.orange[700],
//                   duration: const Duration(seconds: 3),
//                 ),
//               );
//             });
//           }
//
//           if (viewModel.isLoading && viewModel.posts.isEmpty) {
//             return const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(
//                     valueColor:
//                         AlwaysStoppedAnimation<Color>(Colors.deepPurple),
//                   ),
//                   SizedBox(height: 16),
//                   Text('Loading posts...'),
//                 ],
//               ),
//             );
//           }
//
//           if (viewModel.error.isNotEmpty && viewModel.posts.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.wifi_off_rounded,
//                     size: 64,
//                     color: Colors.red,
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Connection Issue',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text(
//                       'Could not connect to the server. This might be due to:',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 14),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text(
//                       '• Network restrictions\n• API server issues\n• Firewall settings',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () => viewModel.fetchPosts(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepPurple,
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text('Try Again'),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//           return Column(
//             children: [
//               if (viewModel.usingFallbackData)
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   color: Colors.orange[100],
//                   child: const Row(
//                     children: [
//                       Icon(Icons.info_outline, color: Colors.orange),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           'Showing sample data. Pull down to retry connection.',
//                           style: TextStyle(color: Colors.orange),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               Expanded(
//                 child: RefreshIndicator(
//                   onRefresh: () => viewModel.fetchPosts(),
//                   color: Colors.deepPurple,
//                   child: ListView.builder(
//                     itemCount: viewModel.posts.length,
//                     itemBuilder: (context, index) {
//                       final post = viewModel.posts[index];
//                       return PostCard(post: post);
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: Consumer<PostsViewModel>(
//         builder: (context, viewModel, child) {
//           return FloatingActionButton(
//             onPressed: () => viewModel.fetchPosts(),
//             backgroundColor: Colors.deepPurple,
//             foregroundColor: Colors.white,
//             child: const Icon(Icons.refresh),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/posts_viewmodel.dart';
import '../widgets/post_card.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostsViewModel>(context, listen: false).fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Code Sentinel',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      body: Consumer<PostsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading && viewModel.posts.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF6C63FF)),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading posts...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }

          if (viewModel.error.isNotEmpty && viewModel.posts.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Connection Issue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      viewModel.error,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => viewModel.fetchPosts(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              if (viewModel.usingFallbackData)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Colors.orange[100],
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: Colors.orange),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Showing sample data. Pull down to retry connection.',
                          style: TextStyle(
                            color: Colors.orange[800],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => viewModel.fetchPosts(),
                  color: const Color(0xFF6C63FF),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.posts.length,
                    itemBuilder: (context, index) {
                      final post = viewModel.posts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: PostCard(post: post),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer<PostsViewModel>(
        builder: (context, viewModel, child) {
          return FloatingActionButton(
            onPressed: () => viewModel.fetchPosts(),
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            child: const Icon(Icons.refresh),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }
}
