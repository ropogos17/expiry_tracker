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
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFDBA74), width: 1.5),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/item_category_backgrounds/meat.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFF7ED), Color(0xB3FFF7ED)],
                    stops: [0.4, 1],
                  ),
                ),
              ),
            ),

            // Tartalom
            Padding(
              padding: const EdgeInsets.all(10),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    if (imagePath != null)
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(imagePath!, fit: BoxFit.cover),
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 1),
                          Text(
                            title,
                            style: TextStyle(
                              color: Color(0xFF92400E),
                              fontSize: 16,
                              fontFamily: "Inter",
                            ),
                          ),
                          Text(
                            "$daysLeft nap",
                            style: TextStyle(
                              color: Color(0xFF6B6B6B),
                              fontSize: 14,
                              fontFamily: "Inter",
                            ),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 6),
                        Image.asset("assets/images/details.png", width: 23),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(width: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
