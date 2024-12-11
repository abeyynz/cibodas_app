import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedPage;
  final ValueChanged<int> onItemTapped;

  const CustomNavigationBar({
    Key? key,
    required this.selectedPage,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.restaurant_menu,
      Icons.local_activity,
      Icons.support_agent,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: const BoxDecoration(
        color: Color(0xFF273228),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) => GestureDetector(
            onTap: () {
              onItemTapped(index); // Menangani klik pada ikon
            },
            child: Icon(
              icons[index],
              size: 32,
              color: selectedPage == index
                  ? Colors.orange // Warna aktif (ganti dengan warna yang sesuai)
                  : Colors.white.withOpacity(0.4), // Warna tidak aktif
            ),
          ),
        ),
      ),
    );
  }
}
