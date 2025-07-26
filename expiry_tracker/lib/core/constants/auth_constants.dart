import '../models/social_media.dart';

class AuthConstants {
  static const SocialMedia facebook = SocialMedia(
    name: 'Facebook',
    url: 'https://facebook.com/',
    assetPath: 'assets/images/social_media/facebook.png',
  );

  static const SocialMedia google = SocialMedia(
    name: 'Google',
    url: 'https://google.com/',
    assetPath: 'assets/images/social_media/google.png',
  );

  static const SocialMedia apple = SocialMedia(
    name: 'Apple',
    url: 'https://apple.com/',
    assetPath: 'assets/images/social_media/apple.png',
  );

  static const List<SocialMedia> socialMedia = [facebook, google, apple];
}
