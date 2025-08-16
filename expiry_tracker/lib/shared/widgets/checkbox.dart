import 'package:flutter/material.dart';

class Checkbox extends StatelessWidget {
  final bool isChecked;
  final Widget? description;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final double checkboxSize;

  const Checkbox({
    super.key,
    this.isChecked = false,
    this.description,
    this.margin,
    this.onTap,
    this.checkboxSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: checkboxSize,
              width: checkboxSize,
              decoration: BoxDecoration(
                color: isChecked ? Color(0xFF3B82F6) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: BoxBorder.all(color: Color(0xFFD1D5DB)),
              ),
              child: isChecked
                  ? Padding(
                      padding: EdgeInsetsGeometry.all(4),
                      child: Image.asset(
                        "assets/images/tick.png",
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(width: checkboxSize * 0.5),
          if (description != null) Expanded(child: description!),
        ],
      ),
    );
  }
}
