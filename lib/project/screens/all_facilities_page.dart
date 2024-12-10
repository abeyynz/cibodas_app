import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/fasilitas_model.dart';
import 'package:app_cibodas/project/screens/detail_fasilitas.dart';
import 'package:app_cibodas/project/widgets/fasilitas.dart';
import 'package:flutter/material.dart';

class AllFacilitiesPage extends StatefulWidget {
  final List<FasilitasModel> fasilitas;

  const AllFacilitiesPage({Key? key, required this.fasilitas}) : super(key: key);

  @override
  _AllFacilitiesPageState createState() => _AllFacilitiesPageState();
}

class _AllFacilitiesPageState extends State<AllFacilitiesPage> {
  String searchQuery = "";
  late List<FasilitasModel> filteredFasilitas;

  @override
  void initState() {
    super.initState();
    filteredFasilitas = widget.fasilitas;
  }

  void _filterFasilitas(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredFasilitas = widget.fasilitas
          .where((fasilitas) =>
              fasilitas.name.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Semua Fasilitas", style: TextStyle(color: dTextColor),),
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
                onChanged: _filterFasilitas,
                decoration: const InputDecoration(
                  hintText: 'Cari fasilitas...',
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
            child: filteredFasilitas.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: filteredFasilitas.length,
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
                              builder: (_) => DetailFasilitas(
                                  fasilitas: filteredFasilitas[index]),
                            ),
                          );
                        },
                        child: FasilityDestination(
                          destination: filteredFasilitas[index],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'fasilitas tidak ditemukan.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
