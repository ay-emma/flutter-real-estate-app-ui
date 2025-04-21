import 'package:emma_real_estate_app/src/style/assets.dart';
import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:emma_real_estate_app/src/views/widgets/pin_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool showText = true;
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final scaleEffect = ScaleEffect(
    alignment: Alignment.center,
    begin: Offset(0, 0),
    end: Offset(1, 1),
    duration: 500.ms,
    curve: Curves.easeInOut,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.mapImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 230,
              left: 80,
              child: PinMarker(text: "10,3 mn P", showText: showText),
            ),
            Positioned(
              top: 300,
              left: 130,
              child: PinMarker(text: "11 mn P", showText: showText),
            ),
            Positioned(
              top: 325,
              left: 260,
              child: PinMarker(text: "7,8 mn P", showText: showText),
            ),
            Positioned(
              top: 470,
              left: 80,
              child: PinMarker(text: "13,3 mn P", showText: showText),
            ),
            Positioned(
              top: 420,
              left: 250,
              child: PinMarker(text: "8,5 mn P", showText: showText),
            ),
            Positioned(
              top: 520,
              left: 200,
              child: PinMarker(text: "6,95 mn P", showText: showText),
            ),

            Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: Styles.ph15,
                    child: Row(
                      children: [
                        Expanded(
                          child: Animate(
                            effects: [scaleEffect],
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Saint Petersburg",
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Styles.w10,
                        Animate(
                          effects: [scaleEffect],
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Icon(Icons.tune)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Styles.h20,
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 200,
          color: Colors.transparent,
          child: Padding(
            padding: Styles.ph30,
            child: Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => _tooltipController.toggle(),
                      child: TapRegion(
                        onTapUpOutside: (event) {
                          _tooltipController.hide();
                        },
                        child: OverlayPortal(
                          controller: _tooltipController,
                          overlayChildBuilder: (BuildContext context) {
                            return Positioned(
                              left: 40,
                              bottom: 150,
                              child: Animate(
                                effects: [
                                  ScaleEffect(
                                    alignment: Alignment.bottomLeft,
                                    begin: Offset(0, 0),
                                    end: Offset(1, 1),
                                    duration: 300.ms,
                                    curve: Curves.easeInOut,
                                  ),
                                ],
                                child: Container(
                                  height: 170,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,
                                      top: 15,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildTextTile(
                                          Icons.verified_user_outlined,
                                          "Cosy areas",
                                        ),
                                        Styles.h15,
                                        _buildTextTile(
                                          Icons.wallet,
                                          "Price",
                                          isSelected: true,
                                        ),
                                        Styles.h15,
                                        _buildTextTile(
                                          Icons.emoji_transportation_outlined,
                                          "Infastructure",
                                        ),
                                        Styles.h15,
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showText = !showText;
                                            });
                                            _tooltipController.hide();
                                            debugPrint("Show text: $showText");
                                          },
                                          child: _buildTextTile(
                                            Icons.layers,
                                            "Without any layers",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Animate(
                            effects: [scaleEffect],
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.45),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.tune, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Styles.h10,
                    Animate(
                      effects: [scaleEffect],
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.45),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Transform.rotate(
                            angle:
                                -45 *
                                3.14159 /
                                180, // Convert 45 degrees to radians
                            child: Icon(
                              Icons.send_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Animate(
                  effects: [
                    ScaleEffect(
                      alignment: Alignment.center,
                      begin: Offset(0, 0),
                      end: Offset(1, 1),
                      duration: 500.ms,
                      curve: Curves.easeInOut,
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.format_align_left, color: Colors.white),
                          Text(
                            "List of Variants",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
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

  Widget _buildTextTile(IconData icon, String text, {bool isSelected = false}) {
    return Row(
      children: [
        Icon(icon, color: isSelected ? Styles.orange : Colors.grey, size: 20),
        Styles.w10,
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Styles.orange : Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
