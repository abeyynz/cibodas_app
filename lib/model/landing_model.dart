class SlideModel {
  final String image;
  final String title;
  final String description;

  SlideModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<SlideModel> slides = [
  SlideModel(
    image: 'assets/kebunsatu.jpg',
    title: '#AYOKEKEBUNRAYA, lihat destinasi tujuan yang tersedia',
    description: 'Lihatlah apa saja yang ada disana, jangan ketinggalan!',
  ),
  SlideModel(
    image: 'assets/kebundua.jpg',
    title: 'TERSESAT? \n Tidak akan pernah!',
    description: 'Kami menyediakan titik lokasi destinasi untuk membantu mu menemukan tempat yang kamu mau',
  ),
  SlideModel(
    image: 'assets/kebuntiga.jpg',
    title: 'FLEXIBLE!, \n kamu mau beli tiket masuk?',
    description: 'Kamu bisa melakukan transaksi tiket disini, dan penwaran informasi lainnya',
  ),
];
