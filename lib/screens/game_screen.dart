import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/game_words.dart';
import '../widgets/custom_keyboard.dart';
import '../widgets/status_tile.dart';

class GameScreen extends StatefulWidget {
  // Accept an optional list from the URL (passed from main.dart)
  final List<String>? teacherList;

  const GameScreen({super.key, this.teacherList});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String currentGuess = ""; 
  String targetWord = ""; 
  List<String> pastGuesses = []; 
  Map<String, TileStatus> keyStatuses = {};
  
  // STATES
  bool isGameWon = false; 
  bool showWinAnimation = false;
  bool showFeedback = false;
  String feedbackMessage = "";

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  // LOGIC: The actual reset mechanism
  void _startNewGame() {
    setState(() {
      // LOGIC UPGRADE: Choose the Source Pool
      List<String> pool;
      
      // 1. Is there a valid Teacher List?
      if (widget.teacherList != null && widget.teacherList!.isNotEmpty) {
        pool = widget.teacherList!;
        print("USING TEACHER LIST: $pool"); 
      } else {
        // 2. Fallback to standard game
        pool = GameWords.allTargets;
        print("USING STANDARD LIST");
      }

      final randomIndex = Random().nextInt(pool.length);
      targetWord = pool[randomIndex];
      
      currentGuess = "";
      pastGuesses = [];
      keyStatuses = {}; 
      
      showWinAnimation = false;
      showFeedback = false; 
      isGameWon = false; 
      
      print("TARGET WORD IS: $targetWord");
    });
  }

  // LOGIC: The "Bouncer" that decides if we need a confirmation dialog
  void _onNewGameTap() {
    // 1. If they already won, OR haven't guessed anything yet, just restart immediately.
    if (isGameWon || pastGuesses.isEmpty) {
      _startNewGame();
      return;
    }

    // 2. Otherwise, they are in the middle of a game. Confirm!
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Start New Game?", style: TextStyle(color: AppColors.techBlue, fontWeight: FontWeight.bold)),
          content: const Text("You will lose your current guesses."),
          actions: [
            // The "No" button (Cancel)
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text("Keep Playing", style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
            // The "Yes" button (Action)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cautionAmber,
                foregroundColor: AppColors.textBlack,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                _startNewGame(); // Actually reset
              }, 
              child: const Text("Start Over", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _checkGuess() {
    List<TileStatus> statuses = _getStatusesForGuess(currentGuess, targetWord);

    for (int i = 0; i < 3; i++) {
      String letter = currentGuess[i];
      TileStatus currentStatus = statuses[i];

      if (!keyStatuses.containsKey(letter) || 
          (keyStatuses[letter] == TileStatus.wrong && currentStatus != TileStatus.wrong) ||
          (keyStatuses[letter] == TileStatus.close && currentStatus == TileStatus.correct)) {
        keyStatuses[letter] = currentStatus;
      }
    }

    pastGuesses.add(currentGuess);
    
    if (currentGuess == targetWord) {
      print("WINNER!"); 
      isGameWon = true;
      _triggerWinAnimation();
    }
    
    currentGuess = "";
  }

  List<TileStatus> _getStatusesForGuess(String guess, String target) {
    List<TileStatus> results = List.filled(3, TileStatus.wrong);
    List<String> targetChars = target.split('');
    List<String> guessChars = guess.split('');

    for (int i = 0; i < 3; i++) {
      if (guessChars[i] == targetChars[i]) {
        results[i] = TileStatus.correct;
        targetChars[i] = ''; 
        guessChars[i] = '#'; 
      }
    }

    for (int i = 0; i < 3; i++) {
      if (guessChars[i] == '#') continue; 
      int indexInTarget = targetChars.indexOf(guessChars[i]);
      if (indexInTarget != -1) {
        results[i] = TileStatus.close;
        targetChars[indexInTarget] = ''; 
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

  void _triggerFeedback(String message) {
    setState(() {
      feedbackMessage = message;
      showFeedback = true;
    });
    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          showFeedback = false;
        });
      }
    });
  }

  void _onKeyTapped(String key) {
    if (showWinAnimation || isGameWon || showFeedback) return;

    setState(() {
      if (key == 'ENTER') {
        if (currentGuess.contains('_')) {
          _triggerFeedback("Fill Blanks!"); 
        } 
        else if (currentGuess.length < 3) {
           _triggerFeedback("Too Short!"); 
        } 
        else if (!GameWords.validGuesses.contains(currentGuess)) {
           _triggerFeedback("Not in Word List"); 
        } 
        else {
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.techBlue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.school, color: Colors.white, size: 40),
                  SizedBox(height: 10),
                  Text("FlexWord Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
                ],
              ),
            ),
            ListTile(leading: const Icon(Icons.info_outline), title: const Text('About'), onTap: () { }),
            ListTile(leading: const Icon(Icons.people_outline), title: const Text('For Teachers'), onTap: () { }),
            ListTile(leading: const Icon(Icons.list_alt), title: const Text('Vocabulary List'), onTap: () { }),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
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
                    Expanded(
                      child: Container(
                        color: AppColors.backgroundGray,
                        padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
                        child: Column(children: leftColumn.map((guess) => _buildPastGuessRow(guess)).toList()),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColors.backgroundGray,
                        padding: const EdgeInsets.only(top: 20, left: 5, right: 10),
                        child: Column(children: rightColumn.map((guess) => _buildPastGuessRow(guess)).toList()),
                      ),
                    ),
                  ],
                ),
              ),
              
              // ACTIVE INPUT AREA
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center, 
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildActiveBox(0),
                        const SizedBox(width: 10),
                        _buildActiveBox(1),
                        const SizedBox(width: 10),
                        _buildActiveBox(2),
                      ],
                    ),
                    
                    // BUTTON CALLS _onNewGameTap NOW
                    Positioned(
                      left: 0,
                      child: SizedBox(
                        height: 45, 
                        child: ElevatedButton(
                          onPressed: _onNewGameTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.techBlue, 
                            foregroundColor: Colors.white, 
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            elevation: 2, 
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            "NEXT\nGAME", 
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
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
                      Text("YES!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.techBlue)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          IgnorePointer(
            ignoring: !showFeedback,
            child: AnimatedOpacity(
              opacity: showFeedback ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.cautionAmber, width: 5),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0,4))]
                  ),
                  child: Text(
                    feedbackMessage,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textBlack),
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
    List<TileStatus> statuses = _getStatusesForGuess(word, targetWord);
    List<Widget> tiles = [];
    for (int i = 0; i < word.length; i++) {
      tiles.add(StatusTile(letter: word[i], status: statuses[i], size: 35)); 
      tiles.add(const SizedBox(width: 8)); 
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), 
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: tiles),
    );
  }

  Widget _buildActiveBox(int index) {
    String letter = "";
    if (index < currentGuess.length) letter = currentGuess[index];
    return Container(
      width: 60, height: 60, alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: letter.isEmpty ? Colors.grey : AppColors.techBlue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(letter, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textBlack)),
    );
  }
}
// END OF FILE