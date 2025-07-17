import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? profileImageUrl;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.profileImageUrl,
    this.onProfileTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    final String titleGreetings = "${title.split(", ")[0]}, ";
    final String titleName = title.split(", ")[1];

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              // Profile picture and title container (clickable)
              Expanded(
                child: GestureDetector(
                  onTap:
                      onProfileTap ??
                      () {
                        // Navigate to settings page
                        Navigator.pushNamed(context, '/settings');
                      },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        // Profile picture
                        CircleAvatar(
                          radius: 21,
                          backgroundImage: profileImageUrl != null
                              ? NetworkImage(profileImageUrl!)
                              : null,
                          backgroundColor: Colors.grey[200],
                          child: profileImageUrl == null
                              ? Icon(
                                  Icons.person,
                                  size: 24,
                                  color: Colors.grey[600],
                                )
                              : null,
                        ),
                        SizedBox(width: 12),
                        // Title
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                titleGreetings,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                titleName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Bell icon (clickable)
              GestureDetector(
                onTap:
                    onNotificationTap ??
                    () {
                      // Navigate to announcements page
                      Navigator.pushNamed(context, '/announcements');
                    },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 30,
                    color: Color(0xFFF59E0B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
