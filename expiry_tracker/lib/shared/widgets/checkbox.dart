import 'package:flutter/material.dart';

class Checkbox extends StatelessWidget {
  final bool isChecked;
  final Widget? description;
  final EdgeInsetsGeometry? margin;

  const Checkbox({
    super.key,
    this.isChecked = false,
    this.description,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: BoxBorder.all(color: Color(0xFFD1D5DB)),
            ),
          ),
          SizedBox(width: 10),
          if (description != null) Expanded(child: description!),
        ],
      ),
    );
  }
}
