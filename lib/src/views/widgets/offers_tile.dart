import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OffersTile extends StatefulWidget {
  const OffersTile({super.key});

  @override
  State<OffersTile> createState() => _OffersTileState();
}

class _OffersTileState extends State<OffersTile>
    with SingleTickerProviderStateMixin {
  final double boxSize = 175;

  final int buyOffersTarget = 1034;
  final int rentOffersTarget = 2212;

  // Current displayed values
  int _buyOffersValue = 0;
  int _rentOffersValue = 0;

  late AnimationController _countController;
  late Animation<double> _buyAnimation;
  late Animation<double> _rentAnimation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller with the specified duration
    _countController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    // Create animations for buy offers
    _buyAnimation = Tween<double>(
      begin: 0,
      end: buyOffersTarget.toDouble(),
    ).animate(
      CurvedAnimation(parent: _countController, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {
        _buyOffersValue = _buyAnimation.value.round();
      });
    });

    // Create animations for rent offers
    _rentAnimation = Tween<double>(
      begin: 0,
      end: rentOffersTarget.toDouble(),
    ).animate(
      CurvedAnimation(parent: _countController, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {
        _rentOffersValue = _rentAnimation.value.round();
      });
    });

    // Start the animation when widget is built
    _countController.forward();
  }

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.p15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Animate(
            effects: [
              ScaleEffect(
                alignment: Alignment.center,
                begin: Offset(0.00, 0.00),
                end: Offset(1, 1),
                duration: 900.ms,
                delay: 800.ms,
                curve: Curves.easeInOut,
              ),
            ],
            child: Container(
              height: boxSize,
              width: boxSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFB9E12),
              ),
              child: Column(
                children: [
                  Styles.h15,
                  Text(
                    "Buy",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    _buyOffersValue.toString(), // Using animated value
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "offers",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Styles.h15,
                ],
              ),
            ),
          ),
          Animate(
            effects: [
              ScaleEffect(
                alignment: Alignment.center,
                begin: Offset(0.00, 0.00),
                end: Offset(1, 1),
                duration: 900.ms,
                delay: 800.ms,
                curve: Curves.easeInOut,
              ),
            ],
            child: Container(
              height: boxSize,
              width: boxSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFFEFBF6),
              ),
              child: Column(
                children: [
                  Styles.h15,
                  Text(
                    "RENT",
                    style: TextStyle(color: Styles.textColor1, fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    _rentOffersValue.toString(), // Using animated value
                    style: TextStyle(
                      fontSize: 34,
                      color: Styles.textColor1,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "offers",
                    style: TextStyle(
                      fontSize: 12,
                      color: Styles.textColor1,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Styles.h15,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
