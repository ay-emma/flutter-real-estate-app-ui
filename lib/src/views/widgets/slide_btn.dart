import 'dart:ui';

import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:flutter/material.dart';

class SlideBtn extends StatefulWidget {
  const SlideBtn({super.key, required this.text, this.isSmallWidget = false});
  final bool isSmallWidget;
  final String text;

  @override
  State<SlideBtn> createState() => _SlideBtnState();
}

class _SlideBtnState extends State<SlideBtn>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    _widthAnimation = Tween<double>(begin: 50.0, end: 320.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start animation when widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.p15,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            alignment: Alignment.centerLeft,
            height: widget.isSmallWidget ? 40 : 60,
            width: _widthAnimation.value,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(40.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (_widthAnimation.value > 100)
                    Expanded(
                      child: Opacity(
                        opacity: _textOpacityAnimation.value,
                        child: Center(
                          child: Text(
                            widget.text,
                            style: TextStyle(
                              fontSize: widget.isSmallWidget ? 12 : 15,
                              fontWeight: FontWeight.w500,
                              color: Styles.appIconBlack,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withValues(alpha: 0.6),
                          spreadRadius: 4,
                          blurRadius: 15,
                          offset: const Offset(-6, 0),
                        ),
                      ],
                    ),
                    child: Icon(Icons.chevron_right, color: Styles.iconColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
