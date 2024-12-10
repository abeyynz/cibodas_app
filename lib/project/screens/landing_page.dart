// // lib/project/screens/landing_page.dart
// import 'package:flutter/material.dart';
// import 'homepage.dart';  // Ganti dengan halaman utama Anda

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Background dengan gambar
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/danau2.jpeg'),  // Ganti dengan gambar background Anda
//             fit: BoxFit.cover,  // Agar gambar memenuhi seluruh layar
//           ),
//         ),
//         child: Align(
//           alignment: Alignment.centerLeft,  // Menempatkan konten di sisi kiri layar
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10.0),  // Jarak dari sisi kiri
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,  // Vertikal Center
//               crossAxisAlignment: CrossAxisAlignment.start,  // Horizontal Start
//               children: [
//                 // Logo di kiri tengah layar
//                 Image.asset(
//                   'assets/logokecil.png',  // Ganti dengan logo Anda
//                   width: 500,
//                   height: 500,
//                 ),
//                 const SizedBox(height: 5),  // Jarak antara logo dan tombol

//                 // Tombol mulai
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => const HomePage()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,  // Warna tombol
//                     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                   ),
//                   child: const Text(
//                     'Mulai Jelajahi',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'homepage.dart';  // Ganti dengan halaman utama Anda

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background dengan gambar
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/danau2.jpeg'),  // Ganti dengan gambar background Anda
            fit: BoxFit.cover,  // Agar gambar memenuhi seluruh layar
          ),
        ),
        child: Center( // Pusatkan seluruh isi
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Vertikal Center
            children: [
              // Logo di tengah layar
              Image.asset(
                'assets/logokecil.png',  // Ganti dengan logo Anda
                width: 500, // Sesuaikan ukuran
                height: 500, // Sesuaikan ukuran
              ),
              const SizedBox(height: 5),  // Jarak antara logo dan tombol

              // Tombol mulai
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,  // Warna tombol
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Mulai Jelajahi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

