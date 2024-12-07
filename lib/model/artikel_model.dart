import 'dart:math';

Random random = Random();
const kontak =
    'KONTAK KAMI.';

class ArtikelModel {
  final int id;
  final List<String>? image;
  final String title, description, category;

  ArtikelModel({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.description,
  });
}

List<ArtikelModel> listArtikel = [
  // rekomendasi destinations
  ArtikelModel(
      id: 1,
      title: "Ini Dia, Menu Makanan Hemat di Acara Sunset di Kebun",
      category: 'artikel',
      image: [
        "assets/artikel1.jpeg",
      ],
      description: "Makanan dan minuman yang bisa nemenin kamu nonton musisi favorit saat Sunset di Kebun Raya Cibodas",
  
  ),
  ArtikelModel(
      id: 2,
      title: "Keindahan Sunset di Kebun Raya Cibodas",
      category: 'artikel',
      image: [
        "assets/artikel.jpg",
      ],
      description: "Kebun Raya Cibodas adalah destinasi wisata alam yang menawarkan pengalaman berbeda bagi para pengunjung",
  ),
];
