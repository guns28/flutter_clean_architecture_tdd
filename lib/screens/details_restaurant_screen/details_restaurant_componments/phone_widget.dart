import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/globals/ioc_container.dart';
import 'package:mobile_app_engineer/services/launch_url_service.dart';

class PhoneWidget {

  Widget phoneCell(Icon icon, String title) {
    final launchUrlService = container.resolve<LaunchUrlService>();

    return GestureDetector(
      onTap: (){
        launchUrlService.launchURL("tel:$title");
      } ,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              icon,
              SizedBox(width: 8),
              Text(
                title,
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
