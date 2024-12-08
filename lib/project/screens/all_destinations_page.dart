import 'package:app_cibodas/project/screens/detail_destination.dart';
import 'package:app_cibodas/project/widgets/popular_destination.dart';
import 'package:flutter/material.dart';
import 'package:app_cibodas/model/destination_model.dart';
import 'package:app_cibodas/const.dart';

class AllDestinationsPage extends StatelessWidget {
  final List<TravelDestination> destinations;

  const AllDestinationsPage({super.key, required this.destinations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Destinasi'),
        backgroundColor: kButtonColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: destinations.length,
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
                    builder: (_) => DetailDestinasi(destination: destinations[index]),
                  ),
                );
              },
              child: PopularDestination(destination: destinations[index]),
            );
          },
        ),
      ),
    );
  }
}
