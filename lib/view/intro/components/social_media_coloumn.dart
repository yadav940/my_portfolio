import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
            icon: 'assets/icons/linkedin.svg',
            onTap: () =>
                launchUrl(Uri.parse('https://www.linkedin.com/in/yadav940/'))),
        SocialMediaIcon(
          icon: 'assets/icons/github.svg',
          onTap: () => launchUrl(Uri.parse('https://github.com/yadav940')),
        ),
        SocialMediaIcon(
          icon: 'assets/images/hackerrank.png',
          onTap: () => launchUrl(
              Uri.parse('https://www.hackerrank.com/profile/yadav940')),
        ),
        //
        SocialMediaIcon(
          icon: 'assets/images/stackoverflow.svg',
          onTap: () => launchUrl(
              Uri.parse("https://stackoverflow.com/users/6566665/vinod-yadav")),
        ),
      ],
    );
  }
}
