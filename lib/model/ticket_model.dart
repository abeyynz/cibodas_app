class TicketModel {
  final String name;
  final String imagePath;
  final String description;
  final int price;

  TicketModel({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}

List<TicketModel> tickets = [
  TicketModel(name: "Tiket Weekend", 
  imagePath: "assets/rumahkaca2.jpeg", 
  description: "Nikmati liburan akhir pekan dengan tiket khusus!", 
  price: 25500,
  ),
  TicketModel(name: "Tiket Weekday", 
  imagePath: "assets/danau2.jpeg", 
  description: "Tiket spesial untuk kunjungan di hari biasa.", 
  price: 15500,
  ),
];

