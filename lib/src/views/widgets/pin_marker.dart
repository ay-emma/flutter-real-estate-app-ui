import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PinMarker extends StatefulWidget {
  const PinMarker({super.key, required this.text, this.showText = true});
  final String text;
  final bool showText;
  static const double bubleRadius = 12.0;
  static const double initialWidth = 90.0;
  static const double collapsedWidth = 55.0;

  @override
  State<PinMarker> createState() => _PinMarkerState();
}

class _PinMarkerState extends State<PinMarker> {
  late double width;
  late bool _isTextVisible;
  late bool _isIconVisible;

  @override
  void initState() {
    super.initState();
    // Initialize state directly based on the initial widget.showText value
    width = widget.showText ? PinMarker.initialWidth : PinMarker.collapsedWidth;
    _isTextVisible = widget.showText;
    _isIconVisible = !widget.showText;
  }

  @override
  void didUpdateWidget(PinMarker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showText != oldWidget.showText) {
      // State change detected, trigger animations via setState
      setState(() {
        if (widget.showText) {
          // Transitioning: false -> true (Show Text)
          _isTextVisible = true; // Animate text in
          _isIconVisible = false; // Animate icon out
          width = PinMarker.initialWidth; // Expand width immediately
        } else {
          // Transitioning: true -> false (Hide Text)
          // Start the hide animation sequence
          _isTextVisible = false; // Animate text out
          _isIconVisible = true; // Animate icon in
          // IMPORTANT: Keep width at initialWidth for now.
          // The collapse animation will be triggered by the text animation's callback.
          width = PinMarker.initialWidth;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
      "Building PinMarker: showText=${widget.showText}, _isTextVisible=$_isTextVisible, _isIconVisible=$_isIconVisible, width=$width",
    );
    return Animate(
      effects: [
        ScaleEffect(
          alignment: Alignment.bottomLeft,
          begin: Offset(0.0, 0.0),
          end: Offset(1, 1),
          duration: 700.ms,
          curve: Curves.easeInOut,
        ),
      ],
      child: AnimatedContainer(
        duration: 300.ms,
        curve: Curves.easeInOut,
        height: 40,
        width: width,
        padding: Styles.ph10,
        decoration: BoxDecoration(
          color: Styles.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(PinMarker.bubleRadius),
            topRight: Radius.circular(PinMarker.bubleRadius),
            bottomRight: Radius.circular(PinMarker.bubleRadius),
          ),
        ),
        child: Center(
          child: ClipRect(
            // Keep ClipRect to prevent painting overflow
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                // Icon: Animate visibility based on _isIconVisible state
                Visibility(
                  visible: _isIconVisible,
                  child: Icon(Icons.location_city_outlined, color: Colors.white)
                      .animate(
                        target: _isIconVisible ? 1 : 0,
                      ) // Target controls fade/scale
                      .fade(duration: 500.ms)
                      .scaleXY(duration: 500.ms, curve: Curves.easeInOut),
                ),

                // Text: Animate visibility based on _isTextVisible state
                Flexible(
                  child: Padding(
                    // Add left padding only when text is visible to space it from the icon
                    padding: EdgeInsets.only(left: _isTextVisible ? 10.0 : 0.0),
                    child: Text(
                          widget.text,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: false,
                        )
                        .animate(
                          target: _isTextVisible ? 1 : 0,
                        ) // Target controls fade/scale
                        .fade(duration: 500.ms)
                        .scaleXY(duration: 500.ms, curve: Curves.easeInOut)
                        .callback(
                          // Callback *after* text animation completes
                          callback: (val) {
                            // Check if we are in the state where text should be hidden
                            if (!_isTextVisible &&
                                mounted &&
                                width != PinMarker.collapsedWidth) {
                              debugPrint(
                                'Text hide animation finished. Collapsing width.',
                              );
                              // Trigger the width collapse animation
                              setState(() {
                                width = PinMarker.collapsedWidth;
                              });
                            }
                          },
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
