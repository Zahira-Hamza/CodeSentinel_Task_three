// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'core/app_router.dart';
// import 'features/presentation/viewmodel/posts_viewmodel.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => PostsViewModel()),
//       ],
//       child: MaterialApp(
//         title: 'Code Sentinel',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         onGenerateRoute: AppRouter.generateRoute,
//         initialRoute: '/posts',
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_router.dart';
import 'features/presentation/viewmodel/posts_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostsViewModel()),
      ],
      child: MaterialApp(
        title: 'Code Sentinel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6C63FF),
            primary: const Color(0xFF6C63FF),
            secondary: const Color(0xFFF50057),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
          ),
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/posts',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
