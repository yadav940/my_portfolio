import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding / 2,
        ),
        const AreaInfoText(title: 'Contact', text: '+91 9628030291'),
        const AreaInfoText(title: 'Email', text: 'vinod.yadav940@gmail.com'),
        InkWell(
          onTap: () {
            launchUrl(Uri.parse('https://www.linkedin.com/in/yadav940/'));
          },
          child: const AreaInfoText(title: 'LinkedIn', text: '@yadav940'),
        ),
        InkWell(
          onTap: () {
            launchUrl(Uri.parse('https://github.com/yadav940'));
          },
          child: const AreaInfoText(title: 'Github', text: '@yadav940'),
        ),

        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          'Skills',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
