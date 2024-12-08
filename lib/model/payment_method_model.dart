class PaymentMethod {
  final String name;
  final String image;

  PaymentMethod({required this.name, required this.image});
}

List<PaymentMethod> paymentMethods = [
  PaymentMethod(name: "GoPay", image: "assets/gopay.png"),
  PaymentMethod(name: "OVO", image: "assets/ovo.png"),
  PaymentMethod(name: "Dana", image: "assets/dana.png"),
  PaymentMethod(name: "QRIS", image: "assets/qris.png"),
];
