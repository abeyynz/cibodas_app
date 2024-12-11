const kontak =
    'KONTAK KAMI';

class RestaurantModel {
  final String name;
  final List<String>? image;
  final String description, location, category, kontak;

  RestaurantModel({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.category,
    required this.kontak,
  });
}
List<RestaurantModel> listRestaurant = [
  RestaurantModel(
    name: 'Cafe Gardenia', 
    image: [
        "assets/gardenia.jpg",
    ], 
    location: '',
    category: 'restaurant',
    description: 'Menikmati hidangan makan utama ataupun kudapan setelah berkeliling dapat dilakukan di Cafe Gardenia. Tersedia juga menu minuman dingin ataupun hangat yang cocok dinikmati di tengah sejuknya udara Kebun Raya Cibodas. Cafe Gardenia berlokasi di dekat salah satu spot favorit, Kolam Besar',
    kontak: kontak
  ),
  RestaurantModel(
    name: 'Raffles Cafe', 
    image: [
        "assets/RafflesCafe.jpg",
    ], 
    location: '',
    category: 'restaurant',
    description: 'Deskripsi restoran A',
    kontak: kontak
  ),
  RestaurantModel(
    name: 'Raffles Sakura', 
    image: [
        "assets/RafflesSakura.jpg",
    ], 
    location: '',
    category: 'restaurant',
    description: 'Deskripsi restoran A',
    kontak: kontak
  ),
  RestaurantModel(
    name: 'Raffles Kitchen', 
    image: [
        "assets/RafflesKitchen.jpg",
    ], 
    location: '',
    category: 'restaurant',
    description: 'Deskripsi restoran A',
    kontak: kontak
  ),
  RestaurantModel(
    name: 'Barbeque in the Park', 
    image: [
        "assets/barbeque.jpg",
    ], 
    location: '',
    category: 'restaurant',
    description: 'Deskripsi restoran A',
    kontak: kontak
  ),
  RestaurantModel(
    name: 'Liwetan', 
    image: [
        "assets/Liwetan.jpg",
    ],
    location: '',
    category: 'restaurant',
    description: 'Deskripsi restoran A',
    kontak: kontak
  ),
  RestaurantModel(
    name: 'Buffet', 
    image: [
        "assets/buffet.jpg",
    ],
    location: '',
    category: 'restaurant',
    description: 'Deskripsi restoran A',
    kontak: kontak
  ),
  RestaurantModel(
    name: 'Stall F&B', 
    image: [
        "assets/peta.png",
    ], 
    location: '',
    category: 'restaurant',
    description: 'Deskripsi restoran A',
    kontak: kontak
  ),
];
