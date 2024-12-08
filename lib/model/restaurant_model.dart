class RestaurantModel {
  final String name;
  final String image;
  final String description;

  RestaurantModel({
    required this.name,
    required this.image,
    required this.description,
  });
}
List<RestaurantModel> listRestaurant = [
  RestaurantModel(
    name: 'Gardenia', 
    image: 'assets/gardenia.jpg', 
    description: 'Deskripsi restoran A'
  ),
  RestaurantModel(
    name: 'Liwetan', 
    image: 'assets/Liwetan.jpg', 
    description: 'Deskripsi restoran A'
  ),
  RestaurantModel(
    name: 'Medinilla', 
    image: 'assets/medinilla.jpeg', 
    description: 'Deskripsi restoran A'
  ),
  RestaurantModel(
    name: 'Restaurant A', 
    image: 'assets/barbeque.jpg', 
    description: 'Deskripsi restoran A'
  ),
  RestaurantModel(
    name: 'Restaurant A', 
    image: 'assets/buffet.jpg', 
    description: 'Deskripsi restoran A'
  ),
  RestaurantModel(
    name: 'Restaurant A', 
    image: 'assets/RafflesCafe.jpg', 
    description: 'Deskripsi restoran A'
  ),
  RestaurantModel(
    name: 'Restaurant A', 
    image: 'assets/RafflesKitchen.jpg', 
    description: 'Deskripsi restoran A'
  ),
  RestaurantModel(
    name: 'Restaurant A', 
    image: 'assets/RafflesSakura.jpg', 
    description: 'Deskripsi restoran A'
  ),
];
