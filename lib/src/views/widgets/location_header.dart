import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LocationHeader extends StatefulWidget {
  const LocationHeader({super.key});

  @override
  State<LocationHeader> createState() => _LocationHeaderState();
}

class _LocationHeaderState extends State<LocationHeader> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        ScaleEffect(
          alignment: Alignment.centerLeft,
          begin: Offset(0.2, 1),
          end: Offset(1, 1),
          duration: 700.ms,
          curve: Curves.easeInOut,
        ),
      ],
      child: Container(
        height: 45,
        padding: Styles.ph15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
                255,
                248,
                206,
                175,
              ).withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Animate(
              delay: 500.ms,
              effects: [FadeEffect(duration: 500.ms, curve: Curves.easeInOut)],
              child: Icon(
                Icons.location_on,
                color: Styles.iconColor, //#A69880
                size: 20,
              ),
            ),
            SizedBox(width: 6),
            Animate(
              delay: 500.ms,
              effects: [FadeEffect(duration: 500.ms, curve: Curves.easeInOut)],
              child: Text(
                "Saint Petersburg",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Styles.textColor1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
