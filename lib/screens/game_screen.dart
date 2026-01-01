import 'dart:async'; // NEW: Needed for the timer to hide the animation
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/game_words.dart';
import '../widgets/custom_keyboard.dart';
import '../widgets/status_tile.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String currentGuess = ""; 
  String targetWord = ""; 
  List<String> pastGuesses = []; 
  Map<String, TileStatus> keyStatuses = {};

  // NEW: Controls the visibility of the "YES!" overlay
  bool showWinAnimation = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      final randomIndex = Random().nextInt(GameWords.allTargets.length);
      targetWord = GameWords.allTargets[randomIndex];
      currentGuess = "";
      pastGuesses = [];
      keyStatuses = {}; 
      showWinAnimation = false; // Reset animation
      print("TARGET WORD IS: $targetWord");
    });
  }

  void _checkGuess() {
    for (int i = 0; i < currentGuess.length; i++) {
      String letter = currentGuess[i];
      TileStatus newStatus;

      if (targetWord[i] == letter) {
        newStatus = TileStatus.correct; 
      } else if (targetWord.contains(letter)) {
        newStatus = TileStatus.close;   
      } else {
        newStatus = TileStatus.wrong;   
      }

      if (keyStatuses[letter] != TileStatus.correct) {
        keyStatuses[letter] = newStatus;
      }
    }

    pastGuesses.add(currentGuess);
    
    // Check for WIN
    if (currentGuess == targetWord) {
      print("WINNER!"); 
      _triggerWinAnimation();
    }
    
    currentGuess = "";
  }

  // NEW: The Animation Logic
  void _triggerWinAnimation() {
    setState(() {
      showWinAnimation = true; // Show it!
    });

    // Wait 2 seconds, then hide it
    Timer(const Duration(seconds: 2), () {
      if (mounted) { // Check if screen is still open
        setState(() {
          showWinAnimation = false;
        });
      }
    });
  }

  void _onKeyTapped(String key) {
    // If animation is playing, freeze input so they can't type
    if (showWinAnimation) return;

    setState(() {
      if (key == 'ENTER') {
        if (currentGuess.contains('_')) {
          print("Fill in the blanks!");
        } else if (currentGuess.length < 3) {
          print("Too short!");
        } else {
          _checkGuess(); 
        }
      } else if (key == 'DEL') {
        if (currentGuess.isNotEmpty) {
          currentGuess = currentGuess.substring(0, currentGuess.length - 1);
        }
      } else {
        if (currentGuess.length < 3) currentGuess += key;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlexWord Educational", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.techBlue,
        centerTitle: true,
        actions: [
           IconButton(icon: const Icon(Icons.refresh, color: Colors.white), onPressed: _startNewGame)
        ],
      ),
      // NEW: We wrap the body in a Stack to float elements on top
      body: Stack(
        children: [
          // LAYER 1: The Game Content (Everything we built before)
          Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch, 
                  children: [
                    Container(
                      width: 80,
                      color: Colors.grey[100],
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          _buildLegendItem(TileStatus.correct, "Right"),
                          const SizedBox(height: 15),
                          _buildLegendItem(TileStatus.close, "Close"),
                          const SizedBox(height: 15),
                          _buildLegendItem(TileStatus.wrong, "Nope"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColors.backgroundGray,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: pastGuesses.length,
                          itemBuilder: (context, index) {
                            return _buildPastGuessRow(pastGuesses[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActiveBox(0),
                    const SizedBox(width: 10),
                    _buildActiveBox(1),
                    const SizedBox(width: 10),
                    _buildActiveBox(2),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.cautionAmber,
                  border: Border(top: BorderSide(color: AppColors.techBlue, width: 4)),
                ),
                child: CustomKeyboard(
                  onKeyPressed: _onKeyTapped,
                  keyStatuses: keyStatuses, 
                ),
              ),
            ],
          ),

          // LAYER 2: The "YES!" Overlay
          // IgnorePointer means user can click 'through' it when it's invisible
          IgnorePointer(
            ignoring: !showWinAnimation,
            child: AnimatedOpacity(
              opacity: showWinAnimation ? 1.0 : 0.0, // 1 = Visible, 0 = Invisible
              duration: const Duration(milliseconds: 500), // Fade speed
              child: Container(
                color: Colors.black.withOpacity(0.4), // Dim background
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.correctGreen, width: 5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star, color: AppColors.cautionAmber, size: 60),
                      SizedBox(height: 10),
                      Text(
                        "YES!",
                        style: TextStyle(
                          fontSize: 50, 
                          fontWeight: FontWeight.bold,
                          color: AppColors.techBlue
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(TileStatus status, String label) {
    return Column(
      children: [
        StatusTile(letter: "", status: status, size: 30),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPastGuessRow(String word) {
    List<Widget> tiles = [];
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      TileStatus status = TileStatus.wrong; 

      if (targetWord[i] == letter) {
        status = TileStatus.correct;
      } else if (targetWord.contains(letter)) {
        status = TileStatus.close;
      }
      
      tiles.add(StatusTile(letter: letter, status: status, size: 35)); 
      tiles.add(const SizedBox(width: 8));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: tiles),
    );
  }

  Widget _buildActiveBox(int index) {
    String letter = "";
    if (index < currentGuess.length) letter = currentGuess[index];

    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: letter.isEmpty ? Colors.grey : AppColors.techBlue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        letter,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textBlack),
      ),
    );
  }
}