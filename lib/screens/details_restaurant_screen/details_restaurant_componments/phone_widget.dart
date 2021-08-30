import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile_app_engineer/services/launch_url_service.dart';

class PhoneWidget {

  Widget phoneCell(Icon icon, String title) {
    final container = KiwiContainer();
    final LaunchUrlService launchUrlService = container.resolve<LaunchUrlService>();

    return GestureDetector(
      onTap: (){
        launchUrlService.launchURL("tel:$title");
      } ,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
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
