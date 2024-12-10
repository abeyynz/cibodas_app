// lib/project/screens/splash_screen.dart
import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/project/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';  // Ganti dengan halaman utama Anda

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menunggu beberapa detik sebelum pindah ke halaman utama
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()), // Ganti dengan halaman utama Anda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kButtonBrightColor,  // Bisa diganti sesuai kebutuhan
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',  // Ganti dengan logo atau gambar lain
              width: 500,
              height: 500,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),  // Ganti dengan warna yang diinginkan
            ),  // Indikator loading
          ],
        ),
      ),
    );
  }
}
