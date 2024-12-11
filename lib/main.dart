
import 'package:app_cibodas/project/screens/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'project/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cibodas Kebun Raya',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RestaurantPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
