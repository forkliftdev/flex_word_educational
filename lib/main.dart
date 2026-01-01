import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants/app_colors.dart';
import 'screens/game_screen.dart';
import 'screens/about_screen.dart';
import 'screens/teacher_screen.dart'; // NEW IMPORT (We will create this next)

void main() {
  runApp(const FlexWordApp());
}

class FlexWordApp extends StatelessWidget {
  const FlexWordApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        // ROUTE 1: The Game (Home)
        GoRoute(
          path: '/',
          builder: (context, state) {
            List<String>? teacherList;

            // CHECK 1: Did we come from the Teacher Dashboard? (Internal Data)
            if (state.extra != null && state.extra is List<String>) {
              teacherList = state.extra as List<String>;
            } 
            // CHECK 2: Did we come from a URL Link? (External Data)
            else {
              final String? rawList = state.uri.queryParameters['list'];
              if (rawList != null && rawList.isNotEmpty) {
                teacherList = rawList
                    .split(',') 
                    .map((e) => e.trim().toUpperCase()) 
                    .where((e) => e.length == 3) 
                    .toList();
              }
            }

            return GameScreen(teacherList: teacherList);
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
      routerConfig: _router,
    );
  }
}