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
      color: Colors.grey[200],
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          // Row 1
          _buildRow(['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P']),
          
          // Row 2
          _buildRow(['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L']),
          
          // Row 3: DEL (Back) on Left, ENTER on Right
          _buildRow(['DEL', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'ENTER']),
          
          // Row 4: Placeholder Key
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.techBlue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => onKeyPressed('_'),
                child: const Text("SPACE / PLACEHOLDER ( _ )", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keys.map((key) {
        int flex = (key == 'ENTER' || key == 'DEL') ? 2 : 1;
        
        return Expanded(
          flex: flex,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              height: 50,
              child: _buildKeyButton(key),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKeyButton(String key) {
    TileStatus status = keyStatuses[key] ?? TileStatus.initial;

    // Special handling for Functional Keys
    if (key == 'ENTER' || key == 'DEL') {
       return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.textBlack,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () => onKeyPressed(key),
          // LOGIC CHANGE: Check for both keys and return TEXT for both
          child: Text(
            key == 'ENTER' ? "ENTER" : "BACK", 
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
       );
    }

    // Standard Letter Keys
    return StatusTile(
      letter: key,
      status: status,
      size: 50, 
      onTap: () => onKeyPressed(key),
    );
  }
}