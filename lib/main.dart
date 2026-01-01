import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // NEW IMPORT
import 'constants/app_colors.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(const FlexWordApp());
}

class FlexWordApp extends StatelessWidget {
  const FlexWordApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SETUP THE ROUTER
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            // 1. LISTEN: Check for 'list' in the URL (e.g. ?list=CAT,DOG)
            final String? rawList = state.uri.queryParameters['list'];
            
            List<String>? teacherList;

            // 2. PARSE: If we found a list, clean it up!
            if (rawList != null && rawList.isNotEmpty) {
              teacherList = rawList
                  .split(',') // Split by comma
                  .map((e) => e.trim().toUpperCase()) // Remove spaces, make CAPS
                  .where((e) => e.length == 3) // Only allow 3-letter words
                  .toList();
            }

            // 3. LAUNCH: Pass the list (if it exists) to the GameScreen
            return GameScreen(teacherList: teacherList);
          },
        ),
      ],
    );

    return MaterialApp.router( // CHANGED TO .router
      title: 'FlexWord Educational',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.techBlue,
        scaffoldBackgroundColor: AppColors.backgroundGray,
        useMaterial3: true,
      ),
      routerConfig: _router, // CONNECT THE ROUTER
    );
  }
}