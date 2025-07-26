import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final DateTime expirationDate;
  final String? imagePath;
  final EdgeInsetsGeometry? margin;

  const ItemCard({
    super.key,
    required this.title,
    required this.expirationDate,
    this.imagePath,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final int daysLeft = expirationDate.difference(DateTime.now()).inDays;

    return Container(
      margin: margin,
      padding: EdgeInsetsGeometry.all(10),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Color(0xFFFDBA74), width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (imagePath != null) Image.asset(imagePath!),
          Column(children: [Text(title), Text("$daysLeft nap")]),
          Image.asset("assets/images/details.png", width: 20),
        ],
      ),
    );
  }
}
