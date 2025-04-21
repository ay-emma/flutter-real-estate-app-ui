import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({super.key, required this.icon, this.isSelected = false});
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        if (isSelected)
          ScaleEffect(
            begin: Offset(0.8, 0.8),
            end: Offset(1, 1),

            duration: const Duration(milliseconds: 200),
          ),
      ],
      child: Container(
        height: isSelected ? 50 : 40,
        width: isSelected ? 50 : 40,
        decoration: BoxDecoration(
          color: isSelected ? Styles.orange : Styles.appIconBlack,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, color: Colors.white),),
      ),
    );
  }
}
