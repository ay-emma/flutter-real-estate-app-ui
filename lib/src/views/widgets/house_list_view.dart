import 'package:emma_real_estate_app/src/style/assets.dart';
import 'package:emma_real_estate_app/src/style/styles.dart';
import 'package:emma_real_estate_app/src/views/widgets/slide_btn.dart';
import 'package:flutter/material.dart';

class HouseListView extends StatelessWidget {
  const HouseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: Styles.ph10,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Styles.h10,
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.house1),
                  fit: BoxFit.cover,
                ),
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SlideBtn(text: "Gladkova St. 25"),
                ),
              ),
            ),
            Styles.h10,
            SizedBox(
              height: 400,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.house2),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,

                        child: SlideBtn(
                          text: "Gubina St. 11",
                          isSmallWidget: true,
                        ),
                      ),
                    ),
                  ),
                  Styles.w10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 195,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.house4),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,

                            child: SlideBtn(
                              text: "Trefolva St. 43",
                              isSmallWidget: true,
                            ),
                          ),
                        ),
                        Styles.h10,

                        Container(
                          height: 195,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.house3),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,

                            child: SlideBtn(
                              text: "Sedova St. 22",
                              isSmallWidget: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Styles.h50,
          ],
        ),
      ),
    );
  }
}
