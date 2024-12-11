import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/project/screens/landing_page.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()), // Ganti dengan halaman utama Anda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kButtonColor, // Bisa diganti sesuai kebutuhan
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 10.0), // Atur nilai padding untuk menggeser ke kanan
              // child: 
              Image.asset(
                "assets/logo_app.gif",
                width: 300,
                height: 300,
              ),
            // ),
            // Tambahkan slogan
            const Text(
              'Your Financial Companion', // Slogan
              style: TextStyle(
                color: Colors.orange, // Warna teks
                fontSize: 18,         // Ukuran font
                fontWeight: FontWeight.bold, // Ketebalan teks
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange), // Ganti dengan warna yang diinginkan
            ), // Indikator loading
          ],
        ),
      ),
    );
  }
}
