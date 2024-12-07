import 'dart:math';

Random random = Random();
const kontak =
    'KONTAK KAMI.';

class FasilitasModel {
  final int id;
  final List<String>? image;
  final String name, description, category, location, kontak;

  var price;

  FasilitasModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.location,
    required this.description,
    required this.kontak,
  });
}

List<FasilitasModel> listFasility = [
  FasilitasModel(
      id: 1,
      name: "Guest House Sakura",
      category: 'fasilitas',
      image: [
        "assets/sakura.jpeg",
      ],
      location: '',
      description: "Guest House Sakura ",
      kontak: kontak
      ),
  FasilitasModel(
      id: 2,
      name: "Shuttle Bus",
      category: 'fasilitas',
      image: [
        "assets/ShuttleBus.jpg",
      ],
      location: '',
      description: "Shuttle Bus",
      kontak: kontak),
  FasilitasModel(
      id: 3,
      name: "E-Scooter",
      category: 'fasilitas',
      image: [
        "assets/E-Scooter.jpeg",
      ],
      location: '',
      description: "E-Scooter",
      kontak: kontak),
  FasilitasModel(
      id: 4,
      name: "Guest House Medinilla",
      category: 'fasilitas',
      image: [
        "assets/medinilla.jpeg",
      ],
      location: '',
      description: "Guest House Medinilla",
      kontak: kontak),
  FasilitasModel(
      id: 5,
      name: "Antelope E-Bike",
      category: 'fasilitas',
      image: [
        "assets/antelope.jpeg",
      ],
      location: '',
      description: "Antelope E-Bike",
      kontak: kontak),
  FasilitasModel(
      id: 6,
      name: "Sepeda",
      category: 'fasilitas',
      image: [
        "assets/sepeda.jpeg",
      ],
      location: '',
      description: "Sepeda",
      kontak: kontak),
];
