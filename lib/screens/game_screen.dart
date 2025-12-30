import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FlexWord Educational",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.techBlue, // Brand Color
        centerTitle: true,
        actions: [
           // The "Teacher Toggle" gear icon we discussed
           IconButton(
             icon: const Icon(Icons.settings, color: Colors.white), 
             onPressed: () {},
           )
        ],
      ),
      body: Column(
        children: [
          // 1. THE HISTORY AREA (The "Chat Stream")
          // Uses Expanded to take up all remaining space
          Expanded(
            child: Container(
              color: AppColors.backgroundGray, // Visual aid to see the area
              child: const Center(
                child: Text("History List will scroll here (59% scale)"),
              ),
            ),
          ),

          // 2. THE ACTIVE INPUT AREA (Anchored at bottom)
          Container(
            height: 120, // Nice big touch target for kids
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: AppColors.cautionAmber, // Brand Color
              border: Border(
                top: BorderSide(color: AppColors.techBlue, width: 4),
              ),
            ),
            child: const Center(
              child: Text(
                "[ _ ] [ _ ] [ _ ]", // Placeholder for the active row
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}