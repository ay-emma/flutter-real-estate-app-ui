import 'package:emma_real_estate_app/src/views/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real estate app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Euclid Circular A",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: const BottomNav(),
    );
  }
}
