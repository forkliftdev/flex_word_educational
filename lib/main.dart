import 'package:flutter/material.dart';
import 'screens/game_screen.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const FlexWordApp());
}

class FlexWordApp extends StatelessWidget {
  const FlexWordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexWord Educational',
      debugShowCheckedModeBanner: false, // Removes the 'debug' sash
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.techBlue),
        useMaterial3: true,
        // Set the default font family here later if you choose a specific one
      ),
      // This directs the app to start at our GameScreen
      home: const GameScreen(),
    );
  }
}