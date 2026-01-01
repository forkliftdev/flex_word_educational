import 'dart:async';
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
      showWinAnimation = false; 
      print("TARGET WORD IS: $targetWord");
    });
  }

  // LOGIC UPDATE: We use the smart helper to update the keyboard
  void _checkGuess() {
    // We get the smart statuses for this specific guess
    List<TileStatus> statuses = _getStatusesForGuess(currentGuess, targetWord);

    // Update Keyboard based on these results
    for (int i = 0; i < 3; i++) {
      String letter = currentGuess[i];
      TileStatus currentStatus = statuses[i];

      // Logic: Only upgrade status (Wrong -> Close -> Correct)
      // If keyboard is already Green, don't turn it Yellow.
      if (!keyStatuses.containsKey(letter) || 
          (keyStatuses[letter] == TileStatus.wrong && currentStatus != TileStatus.wrong) ||
          (keyStatuses[letter] == TileStatus.close && currentStatus == TileStatus.correct)) {
        
        // Note: For the keyboard, if a letter appears TWICE in a guess (one yellow, one gray),
        // we want the keyboard to show the BEST version (Yellow).
        // The logic above handles this naturally.
        keyStatuses[letter] = currentStatus;
      }
    }

    pastGuesses.add(currentGuess);
    
    if (currentGuess == targetWord) {
      print("WINNER!"); 
      _triggerWinAnimation();
    }
    
    currentGuess = "";
  }

  // NEW HELPER: The "Two-Pass" Logic System
  List<TileStatus> _getStatusesForGuess(String guess, String target) {
    List<TileStatus> results = List.filled(3, TileStatus.wrong);
    List<String> targetChars = target.split('');
    List<String> guessChars = guess.split('');

    // PASS 1: Find Exact Matches (Green/Circle)
    for (int i = 0; i < 3; i++) {
      if (guessChars[i] == targetChars[i]) {
        results[i] = TileStatus.correct;
        targetChars[i] = ''; // Remove from pool so it can't be matched again
        guessChars[i] = '#'; // Mark guess as handled
      }
    }

    // PASS 2: Find Close Matches (Yellow/Triangle)
    for (int i = 0; i < 3; i++) {
      if (guessChars[i] == '#') continue; // Skip already handled greens

      int indexInTarget = targetChars.indexOf(guessChars[i]);
      if (indexInTarget != -1) {
        results[i] = TileStatus.close;
        targetChars[indexInTarget] = ''; // Remove this specific instance from pool
      }
    }

    return results;
  }

  void _triggerWinAnimation() {
    setState(() {
      showWinAnimation = true; 
    });
    Timer(const Duration(seconds: 2), () {
      if (mounted) { 
        setState(() {
          showWinAnimation = false;
        });
      }
    });
  }

  void _onKeyTapped(String key) {
    if (showWinAnimation) return;

    setState(() {
      if (key == 'ENTER') {
        if (currentGuess.contains('_')) {
          print("Fill in the blanks!");
        } else if (currentGuess.length < 3) {
          print("Too short!");
        } else if (!GameWords.validGuesses.contains(currentGuess)) {
           print("Not a real word!"); 
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
    // PREPARE THE SPLIT LISTS
    // 8 items for the left column
    int splitIndex = 8;
    List<String> leftColumn = [];
    List<String> rightColumn = [];

    if (pastGuesses.length <= splitIndex) {
      leftColumn = pastGuesses;
    } else {
      leftColumn = pastGuesses.sublist(0, splitIndex);
      rightColumn = pastGuesses.sublist(splitIndex);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("FlexWord Educational", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.techBlue,
        centerTitle: true,
        actions: [
           IconButton(icon: const Icon(Icons.refresh, color: Colors.white), onPressed: _startNewGame)
        ],
      ),
      body: Stack(
        children: [
          // LAYER 1: Game Content
          Column(
            children: [
              // HISTORY AREA (Updated Layout)
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    // LEGEND SIDEBAR
                    Container(
                      width: 80,
                      color: Colors.grey[100],
                      padding: const EdgeInsets.only(top: 20),
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
                    
                    // LEFT COLUMN (0-7)
                    Expanded(
                      child: Container(
                        color: AppColors.backgroundGray,
                        padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
                        child: Column(
                          children: leftColumn.map((guess) => _buildPastGuessRow(guess)).toList(),
                        ),
                      ),
                    ),

                    // RIGHT COLUMN (8+)
                    Expanded(
                      child: Container(
                        color: AppColors.backgroundGray,
                         // Add padding to separate from the right edge
                        padding: const EdgeInsets.only(top: 20, left: 5, right: 10),
                        child: Column(
                          children: rightColumn.map((guess) => _buildPastGuessRow(guess)).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // ACTIVE INPUT AREA
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
              
              // KEYBOARD
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

          // LAYER 2: WIN ANIMATION
          IgnorePointer(
            ignoring: !showWinAnimation,
            child: AnimatedOpacity(
              opacity: showWinAnimation ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                color: Colors.black.withOpacity(0.4),
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
    // NEW: Use the smart helper to determine colors for display
    List<TileStatus> statuses = _getStatusesForGuess(word, targetWord);
    List<Widget> tiles = [];
    
    for (int i = 0; i < word.length; i++) {
      tiles.add(StatusTile(letter: word[i], status: statuses[i], size: 35)); 
      tiles.add(const SizedBox(width: 8)); // Tighter spacing
    }
    
    // Tighter vertical spacing for the row
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), 
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