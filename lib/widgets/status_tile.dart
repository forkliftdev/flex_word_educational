import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum TileStatus { initial, correct, close, wrong }

class StatusTile extends StatelessWidget {
  final String letter;
  final TileStatus status;
  final double size;
  final VoidCallback? onTap; // Allows us to use this as a button later

  const StatusTile({
    super.key,
    required this.letter,
    this.status = TileStatus.initial,
    this.size = 50,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        // We use a CustomPaint or specialized Decorations for shapes
        // But for simplicity in Flutter, we can use specific widgets
        child: _buildShape(),
      ),
    );
  }

  Widget _buildShape() {
    // 1. COLORS
    Color bgColor;
    Color textColor = Colors.white;
    
    switch (status) {
      case TileStatus.correct:
        bgColor = AppColors.techBlue; // #007ACC
        break;
      case TileStatus.close:
        bgColor = AppColors.cautionAmber; // #FFC72C
        break;
      case TileStatus.wrong:
        bgColor = Colors.grey[400]!; 
        break;
      case TileStatus.initial:
        bgColor = Colors.white;
        textColor = AppColors.textBlack;
        break;
    }

    // 2. SHAPES
    // We wrap the Container in different widgets to change the shape
    Widget content = Center(
      child: Text(
        letter,
        style: TextStyle(
          fontSize: size * 0.5,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );

    if (status == TileStatus.correct) {
      // CIRCLE
      return Container(
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: content,
      );
    } else if (status == TileStatus.close) {
      // TRIANGLE
      // We use a Clipper to cut the box into a triangle
      return ClipPath(
        clipper: _TriangleClipper(),
        child: Container(
          color: bgColor,
          child: content, // Note: Text might get clipped if too big, but usually okay
        ),
      );
    } else if (status == TileStatus.wrong) {
      // SQUARE
      return Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4), // Slight edge softening
        ),
        child: content,
      );
    } else {
      // INITIAL (Empty or just typed) - Simple Border Box
      return Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: content,
      );
    }
  }
}

// HELPER: The scissors that cut the square into a triangle
class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0); // Top Center point
    path.lineTo(size.width, size.height); // Bottom Right
    path.lineTo(0, size.height); // Bottom Left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}