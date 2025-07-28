import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String? subText;
  final Key dismissibleKey;
  final String? imagePath;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final void Function(DismissDirection)? onDismissed;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;

  const ItemCard({
    super.key,
    required this.dismissibleKey,
    required this.title,
    this.subText,
    this.imagePath,
    this.margin,
    this.onTap,
    this.onDismissed,
    this.confirmDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismissibleKey,
      direction: DismissDirection.startToEnd,
      //TODO: redesign the bg
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.redAccent,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: onDismissed,
      confirmDismiss: confirmDismiss,
      child: Container(
        margin: margin ?? EdgeInsetsGeometry.symmetric(horizontal: 10),
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
        child: GestureDetector(
          onTap: onTap,
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

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
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
                                subText ?? "",
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
        ),
      ),
    );
  }
}
