import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import '../constants/game_words.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Define the Menu Options (Reordered: Core List is First)
    final Map<String, List<String>> categories = {
      'Core Word List': GameWords.allTargets, // <--- MOVED TO TOP
      'Short A Sounds': GameWords.shortA,
      'Short E Sounds': GameWords.shortE,
      'Short I Sounds': GameWords.shortI,
      'Short O Sounds': GameWords.shortO,
      'Short U Sounds': GameWords.shortU,
      'Sight Words (K-1)': GameWords.sightWords,
      'Animals': GameWords.animals,
      'Verbs (Action Words)': GameWords.verbs,
      'Body Parts': GameWords.bodyParts,
      'Nature & Colors': GameWords.nature,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Dashboard", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.techBlue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue[50],
            width: double.infinity,
            child: const Column(
              children: [
                Icon(Icons.school, size: 50, color: AppColors.techBlue),
                SizedBox(height: 10),
                Text(
                  "Select a Lesson Plan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                ),
                Text(
                  "Tap the Eye icon to view words. Tap the card to start.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          // LIST OF CATEGORIES
          Expanded(
            child: Center(
              // 2. NARROWER CARDS: constrain width to 600px
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String title = categories.keys.elementAt(index);
                    List<String> wordList = categories.values.elementAt(index);
                    bool isCore = title == "Core Word List";

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: isCore ? const BorderSide(color: AppColors.techBlue, width: 2) : BorderSide.none,
                      ),
                      // 3. COMPACT LAYOUT (Custom InkWell instead of ListTile)
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
         // CHECK: Does this category imply a fixed middle letter?
                          String? fixedMiddle;
                          if (title.contains("Short A")) fixedMiddle = 'A';
                           else if (title.contains("Short E")) fixedMiddle = 'E';
                           else if (title.contains("Short I")) fixedMiddle = 'I';
                           else if (title.contains("Short O")) fixedMiddle = 'O';
                           else if (title.contains("Short U")) fixedMiddle = 'U';

         // SEND: Pack it all up
context.go('/', extra: {
  'list': wordList,
  'middle': fixedMiddle,
  'title': title, // <--- NEW: Send the name of the list!
});
},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              // A. COUNT BUBBLE
                              CircleAvatar(
                                backgroundColor: isCore ? AppColors.techBlue : AppColors.cautionAmber,
                                radius: 18,
                                child: Text(
                                  "${wordList.length}", 
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                              
                              const SizedBox(width: 16),

                              // B. TITLE + COUNT TEXT
                              Text(
                                "$title (${wordList.length})", // Count in title
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              
                              const SizedBox(width: 12),
                              
                              // C. EYE ICON (Closer to title)
                              IconButton(
                                icon: const Icon(Icons.visibility_outlined, color: AppColors.techBlue, size: 20),
                                tooltip: "View List",
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(), // Removes default large padding
                                onPressed: () => _showListPreview(context, title, wordList),
                              ),
                              
                              const SizedBox(width: 8),

                              // D. ARROW ICON (Right next to Eye)
                              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                              
                              // E. Spacer ensures the Row takes full width but items stay left
                              const Spacer(), 
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showListPreview(BuildContext context, String title, List<String> words) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Column(
            children: [
              Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.techBlue)),
              const SizedBox(height: 5),
              Text("${words.length} Words", style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.center,
                children: words.map((word) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(word, style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                }).toList(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.techBlue, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).pop(); 
                context.go('/', extra: words); 
              },
              child: const Text("Use This List"),
            ),
          ],
        );
      },
    );
  }
}