import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants/app_colors.dart';
import 'screens/game_screen.dart';
import 'screens/about_screen.dart';
import 'screens/teacher_screen.dart'; // NEW IMPORT (We will create this next)
import 'screens/vocabulary_screen.dart'; // NEW IMPORT
void main() {
  runApp(const FlexWordApp());
}

class FlexWordApp extends StatelessWidget {
  const FlexWordApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        // ROUTE 1: The Game (Home)
        GoRoute(
          path: '/',
          builder: (context, state) {
            List<String>? teacherList;
            String? fixedMiddle;
            String? listTitle; // NEW VARIABLE

            // CASE 1: Internal Navigation (From Teacher Dashboard)
            if (state.extra != null) {
              if (state.extra is Map) {
                final map = state.extra as Map;
                teacherList = map['list'] as List<String>;
                fixedMiddle = map['middle'] as String?;
                listTitle = map['title'] as String?; // EXTRACT TITLE
              } else if (state.extra is List<String>) {
                teacherList = state.extra as List<String>;
              }
            } 
            // CASE 2: External Link (URL)
            else {
              final String? rawList = state.uri.queryParameters['list'];
              if (rawList != null && rawList.isNotEmpty) {
                teacherList = rawList
                    .split(',') 
                    .map((e) => e.trim().toUpperCase()) 
                    .where((e) => e.length == 3) 
                    .toList();
                listTitle = "Custom List"; // Give URL lists a generic name
              }
            }

            return GameScreen(
              teacherList: teacherList,
              fixedMiddle: fixedMiddle,
              listTitle: listTitle, // PASS IT ALONG
            );
          },
        ),

        // ROUTE 2: About Page
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutScreen(),
        ),

        // ROUTE 3: Teacher Dashboard (NEW!)
        GoRoute(
          path: '/teacher',
          builder: (context, state) => const TeacherScreen(),
        ),
        GoRoute(
          path: '/vocabulary',
          builder: (context, state) => const VocabularyScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'FlexWord Educational',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.techBlue,
        scaffoldBackgroundColor: AppColors.backgroundGray,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}