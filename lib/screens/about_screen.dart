import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About FlexWord", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.techBlue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADING
            const Text(
              "Building Literacy, One Guess at a Time.",
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: AppColors.techBlue
              ),
            ),
            const SizedBox(height: 20),
            
            // INTRO TEXT
            const Text(
              "FlexWord Educational is designed specifically for K-1 students, or other English learners, to practice phonics, spelling, and sight words in a safe, frustration-free environment.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),

            // --- NEW: THE VENN DIAGRAM ---
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400), // Keeps it from getting huge on tablets
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/FlexWord_Word_Lists_Venn.jpg',
                    fit: BoxFit.contain, // Ensures the whole circle is visible
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "The 'Bouncer' System: Broad Guesses, Specific Answers",
                style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 30),
            // -----------------------------

            // LEGEND EXPLANATION
            const Text(
              "How to Read the Shapes:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            
            _buildLegendRow(Icons.circle, Colors.blue, "Blue Circle", "Right Letter, Right Place!"),
            const SizedBox(height: 10),
            _buildLegendRow(Icons.change_history, Colors.amber, "Amber Triangle", "Right Letter, Wrong Place."),
            const SizedBox(height: 10),
            _buildLegendRow(Icons.crop_square, Colors.grey, "Grey Square", "Not in the word."),

            const SizedBox(height: 30),
            
            const Divider(),
            const SizedBox(height: 20),

            // PRIVACY NOTE
            const Text(
              "Privacy & Safety:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "• No Ads\n• No Tracking\n• No Internet Required (works offline)\n• No In-App Purchases",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Version 1.0.0", 
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendRow(IconData icon, Color color, String title, String desc) {
    return Row(
      children: [
        Icon(icon, color: color, size: 40),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(desc, style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        )
      ],
    );
  }
}
