import 'package:emma_real_estate_app/src/style/assets.dart';
import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:emma_real_estate_app/src/views/widgets/house_list_view.dart';
import 'package:emma_real_estate_app/src/views/widgets/location_header.dart';
import 'package:emma_real_estate_app/src/views/widgets/offers_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFF8F8F8),
              const Color(0xFFF8F8F8),
              const Color(0xFFF9EDE2),
              const Color(0xFFFAE8D5),
              const Color(0xFFFBDDB9),
              const Color(0xFFF9D8AF),
              const Color.fromARGB(255, 235, 176, 88),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: Styles.ph15,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  //Header
                  SafeArea(
                    child: Row(
                      children: [
                        LocationHeader(),
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
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(Assets.ladyPortrait),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Sub Heading
                  Styles.h30,
                  Animate(
                    delay: 500.ms,
                    effects: [
                      FadeEffect(duration: 500.ms, curve: Curves.easeInOut),
                    ],
                    child: Text(
                      "Hi, Marina",
                      style: TextStyle(fontSize: 26, color: Styles.textColor1),
                    ),
                  ),
                  Styles.h10,

                  Animate(
                    delay: 500.ms,
                    effects: [
                      FadeEffect(duration: 500.ms, curve: Curves.easeInOut),
                      SlideEffect(
                        begin: Offset(0, 0.2),
                        end: Offset(0, 0),
                        duration: 500.ms,
                        curve: Curves.easeInOut,
                      ),
                    ],
                    child: Text(
                      "let's select your\nperfect place",
                      style: TextStyle(
                        fontSize: 36,
                        height: 1.3,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Styles.h30,
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    pinned: false,
                    expandedHeight: 180,
                    flexibleSpace: FlexibleSpaceBar(background: OffersTile()),
                  ),
                  SliverToBoxAdapter(child: HouseListView()),
                  // SliverList.list(children: children)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
