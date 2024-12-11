import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/project/screens/detail_destination.dart';
import 'package:flutter/material.dart';
import 'package:app_cibodas/model/destination_model.dart';
import 'package:app_cibodas/project/widgets/popular_destination.dart';

class AllDestinationsPage extends StatefulWidget {
  final List<TravelDestination> destinations;

  const AllDestinationsPage({super.key, required this.destinations});

  @override
  // ignore: library_private_types_in_public_api
  _AllDestinationsPageState createState() => _AllDestinationsPageState();
}

class _AllDestinationsPageState extends State<AllDestinationsPage> {
  String searchQuery = "";
  late List<TravelDestination> filteredDestinations;

  @override
  void initState() {
    super.initState();
    filteredDestinations = widget.destinations;
  }

  void _filterDestinations(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredDestinations = widget.destinations
          .where((destination) =>
              destination.name.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destinasi Cibodas", style: TextStyle(color: dTextColor),),
        backgroundColor: const Color(0xFF273228),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: dTextColor),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          // Search Bar with green style
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: kButtonColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                onChanged: _filterDestinations,
                decoration: const InputDecoration(
                  hintText: 'Cari destinasi...',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white54, size: 28),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          // Grid of Destinations
          Expanded(
            child: filteredDestinations.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: filteredDestinations.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Dua kolom per baris
                      mainAxisSpacing: 10, // Jarak antar baris
                      crossAxisSpacing: 10, // Jarak antar kolom
                      childAspectRatio: 0.95, // Proporsi tinggi item
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailDestinasi(
                                  destination: filteredDestinations[index]),
                            ),
                          );
                        },
                        child: PopularDestination(
                          destination: filteredDestinations[index],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'Destinasi tidak ditemukan.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
