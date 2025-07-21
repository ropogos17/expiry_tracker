import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isRead;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? borderColor;
  final String? externalLink;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.description,
    this.backgroundColor,
    this.titleColor,
    this.borderColor,
    this.externalLink,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? Colors.grey.shade300,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: externalLink != null
            ? () async {
                final url = Uri.parse(externalLink!);
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch $url')),
                    );
                  }
                }
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14.0,
                  color: isRead ? Colors.grey : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
