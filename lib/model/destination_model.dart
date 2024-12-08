import 'dart:math';

Random random = Random();
const kontak =
    'KONTAK KAMI';

class TravelDestination {
  final int id;
  final List<String>? image;
  final String name, description, category, location, kontak;

  TravelDestination({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.location,
    required this.description,
    required this.kontak,
  });
}

List<TravelDestination> listDestination = [
  // Popular destinations
  TravelDestination(
      id: 1,
      name: "Danau Cibodas",
      category: 'popular',
      image: [
        "assets/danau.jpg",
        "assets/danau2.jpeg",
      ],
      location: '7255+FWJ, Sindangjaya, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat 43253',
      description: "Danau Cibodas adalah sebuah destinasi wisata alam yang terletak di kawasan Puncak, Jawa Barat. Danau ini menawarkan suasana yang asri dengan udara sejuk khas pegunungan, dikelilingi oleh pepohonan hijau dan panorama alam yang menenangkan. Tempat ini cocok untuk wisata keluarga atau sekadar bersantai menikmati keindahan alam. Fasilitas seperti perahu dayung dan area piknik sering menjadi daya tarik utama bagi pengunjung. Lokasinya yang strategis di Puncak menjadikan Danau Cibodas tempat favorit untuk liburan singkat bagi warga sekitar dan wisatawan dari berbagai daerah.",
      kontak: kontak
      ),
  TravelDestination(
      id: 2,
      name: "Rumah Kaca",
      category: 'popular',
      image: [
        "assets/rumahkaca.jpg",
        "assets/rumahkaca2.jpeg",
        "assets/rumahkaca3.jpg",
      ],
      location: '',
      description: "Rumah Kaca",
      kontak: kontak),
  TravelDestination(
      id: 3,
      name: "Curug Cibogo",
      category: 'popular',
      image: [
        "assets/cibogo.jpg",
        "assets/airterjuncibogo2.jpeg",
      ],
      location: '',
      description: "Curug Cibogo",
      kontak: kontak),
  TravelDestination(
      id: 4,
      name: "Taman Liana",
      category: 'popular',
      image: [
        "assets/tamanliana.jpg",
        "assets/tamanliana1-2.jpg",
        "assets/tamanliana1-3.jpg",
        "assets/tamanliana1-4.jpg",
        "assets/tamanliana1-5.jpg",
      ],
      location: '',
      description: "Taman Liana",
      kontak: kontak),
  TravelDestination(
      id: 5,
      name: "Bunga Bangkai",
      category: 'popular',
      image: [
        "assets/bungabangkai.jpeg",
      ],
      location: '',
      description: "Bunga Bangkai",
      kontak: kontak),
  TravelDestination(
      id: 6,
      name: "Taman Lumut",
      category: 'popular',
      image: [
        "assets/tamanlumut.jpg",
        "assets/tamanlumut1.jpeg",
        "assets/tamanlumut2.jpeg",
        "assets/tamanlumut3.jpeg",
      ],
      location: '',
      description: "Taman Lumut",
      kontak: kontak),
];
