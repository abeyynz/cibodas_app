import 'package:app_cibodas/project/screens/detail_fasilitas.dart';
import 'package:app_cibodas/project/widgets/fasilitas.dart';
import 'package:flutter/material.dart';
import 'package:app_cibodas/model/fasilitas_model.dart';
import 'package:app_cibodas/const.dart';

class AllFacilitiesPage extends StatelessWidget {
  final List<FasilitasModel> fasilitas;
  const AllFacilitiesPage({super.key, required this.fasilitas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Fasilitas'),
        backgroundColor: kButtonColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: fasilitas.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dua kolom per baris
            mainAxisSpacing: 5, // Kurangi jarak antar baris
            crossAxisSpacing: 10, // Jarak antar kolom tetap
            childAspectRatio: 0.95, // Menambah tinggi relatif item
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailFasilitas(fasilitas: fasilitas[index]),
                  ),
                );
              },
              child: FasilityDestination(destination: fasilitas[index]),
            );
          },
        ),
      ),
    );
  }
}
