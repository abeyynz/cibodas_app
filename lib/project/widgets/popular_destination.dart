import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/destination_model.dart';
import 'package:flutter/material.dart';

class PopularDestination extends StatelessWidget {
  final TravelDestination destination;
  const PopularDestination({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned(
          bottom: 0,
          right: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.3),
                  spreadRadius: 7,
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ),
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
