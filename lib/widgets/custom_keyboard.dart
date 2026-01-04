import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'status_tile.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;
  final Map<String, TileStatus> keyStatuses;

  const CustomKeyboard({
    super.key,
    required this.onKeyPressed,
    required this.keyStatuses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Standard keyboard background
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1: Q-P
          _buildRow(['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P']),
          
          // Row 2: A-L
          _buildRow(['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L']),
          
          // Row 3 & 4: Winged Layout
          _buildWingedBottom(),
        ],
      ),
    );
  }

  // Helper for standard rows (Q-P, A-L)
  Widget _buildRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: keys.map((key) {
          return Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.5),
              child: SizedBox(
                height: 50, 
                child: _buildLetterKey(key),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // The "Winged" Layout Logic
  Widget _buildWingedBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- LEFT WING: TALL BACK KEY ---
            Expanded(
              flex: 15,
              child: _buildFunctionalKey('DEL'),
            ),

            // --- CENTER STACK: Z-M AND SPACEHOLDER ---
            Expanded(
              flex: 70,
              child: Column(
                children: [
                  // The Z-M Row
                  Row(
                    children: ['Z', 'X', 'C', 'V', 'B', 'N', 'M'].map((key) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.5),
                          child: SizedBox(
                            height: 50,
                            child: _buildLetterKey(key),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 4), 

                  // The SpaceHolder Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.5),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 1,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            // NEW: Added BorderSide to match letter keys
                            side: BorderSide(color: Colors.grey[400]!, width: 1.0),
                          ),
                        ),
                        onPressed: () => onKeyPressed('_'),
                        child: const Text(
                          "SpaceHolder ( _ )",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- RIGHT WING: TALL ENTER KEY ---
            Expanded(
              flex: 15,
              child: _buildFunctionalKey('ENTER'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLetterKey(String key) {
    return StatusTile(
      letter: key,
      status: keyStatuses[key] ?? TileStatus.initial,
      size: 50,
      onTap: () => onKeyPressed(key),
    );
  }

  Widget _buildFunctionalKey(String key) {
    bool isEnter = key == 'ENTER';
    
    Color bgColor = isEnter ? Colors.green[200]! : Colors.red[200]!;
    IconData iconData = isEnter ? Icons.keyboard_return : Icons.backspace_outlined;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.black,
          elevation: 1,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // Optional: You can add a border here too if you want the colored keys to have outlines
            // side: BorderSide(color: Colors.black12, width: 1.0), 
          ),
        ),
        onPressed: () => onKeyPressed(key),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 28, color: Colors.black54),
            const SizedBox(height: 2),
            Text(
              isEnter ? "ENTER" : "BACK",
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}