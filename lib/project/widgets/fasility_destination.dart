// import 'package:app_cibodas/const.dart';
// import 'package:app_cibodas/model/destination_model.dart';
import 'package:app_cibodas/model/fasilitas_model.dart';
import 'package:flutter/material.dart';

class FasilityDestination extends StatelessWidget {
  final FasilitasModel destination; // Use FasilitasModel instead
  const FasilityDestination({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 145,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  destination.image![0], 
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          destination.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
