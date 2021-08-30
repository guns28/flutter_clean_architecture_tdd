import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile_app_engineer/services/launch_url_service.dart';

class WebsiteWidget {
  Widget websiteCell(Icon icon, String url) {
    final container = KiwiContainer();

    final LaunchUrlService launchUrlService =
        container.resolve<LaunchUrlService>();

    return GestureDetector(
      onTap: () {
        launchUrlService.launchURL(url);
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8),
              const Text(
                "Website",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              )
            ],
          )
        ),
    );
  }
}
