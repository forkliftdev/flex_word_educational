import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants/app_colors.dart';
import 'screens/game_screen.dart';
import 'screens/about_screen.dart'; // NEW IMPORT

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
            final String? rawList = state.uri.queryParameters['list'];
            List<String>? teacherList;

            if (rawList != null && rawList.isNotEmpty) {
              teacherList = rawList
                  .split(',') 
                  .map((e) => e.trim().toUpperCase()) 
                  .where((e) => e.length == 3) 
                  .toList();
            }
            return GameScreen(teacherList: teacherList);
          },
        ),

        // ROUTE 2: About Page (NEW!)
        GoRoute(
          path: '/about',
          builder: (context, state) {
            return const AboutScreen();
          },
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