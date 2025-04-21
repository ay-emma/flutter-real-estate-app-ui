import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:emma_real_estate_app/src/views/home_page.dart';
import 'package:emma_real_estate_app/src/views/map_page.dart';
import 'package:emma_real_estate_app/src/views/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  String selectedTab = //can either be "map-search" or "home"
      "home"; // default value

  void changeBtnState(String btnName) {
    setState(() {
      selectedTab = btnName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          if (selectedTab == "home")
            Animate(
              effects: [FadeEffect(duration: 500.ms, curve: Curves.easeInOut)],
              child: HomePage(),
            )
          else
            Animate(
              effects: [FadeEffect(duration: 600.ms, curve: Curves.easeInOut)],
              child: MapPage(),
            ),

          Animate(
            delay: 600.ms,
            effects: [
              FadeEffect(duration: 2000.ms, curve: Curves.easeIn),
              SlideEffect(
                begin: const Offset(0, 10),
                end: const Offset(0, 0),
                duration: 2000.ms,
                curve: Curves.easeIn,
              ),
            ],
            child: Positioned(
              bottom: 25,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    height: 60,
                    width: 270,

                    decoration: BoxDecoration(
                      color: Styles.bottomNavBlack,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            changeBtnState("map-search");
                          },
                          child: IconBtn(
                            icon: Icons.search,
                            isSelected: selectedTab == "map-search",
                          ),
                        ),
                        IconBtn(icon: Icons.chat),
                        InkWell(
                          onTap: () {
                            changeBtnState("home");
                          },
                          child: IconBtn(
                            icon: Icons.home,
                            isSelected: selectedTab == "home",
                          ),
                        ),
                        IconBtn(icon: Icons.favorite),
                        IconBtn(icon: Icons.person),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
