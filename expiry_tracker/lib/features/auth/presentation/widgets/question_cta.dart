import 'package:flutter/material.dart';

class QuestionCta extends StatelessWidget {
  final String? question;
  final String cta;
  final Color? questionColor;
  final Color? ctaColor;
  final VoidCallback? onTap;

  const QuestionCta({
    super.key,
    this.question,
    required this.cta,
    this.questionColor,
    this.ctaColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final defaultCtaColor = ctaColor ?? const Color(0xFF3B82F6);

    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontFamily: "Inter"),
          children: [
            if (question != null)
              TextSpan(
                text: "${question!.trim()} ",
                style: TextStyle(color: Colors.black),
              ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 18,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: defaultCtaColor, width: 1),
                    ),
                  ),
                  child: Text(
                    cta.trim(),
                    style: TextStyle(
                      color: defaultCtaColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
