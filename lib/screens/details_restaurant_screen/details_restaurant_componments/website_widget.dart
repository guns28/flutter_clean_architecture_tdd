import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/globals/ioc_container.dart';
import 'package:mobile_app_engineer/services/launch_url_service.dart';

class WebsiteWidget {

  Widget websiteCell(Icon icon, String url) {
    final launchUrlService = container.resolve<LaunchUrlService>();

    return GestureDetector(
      onTap: (){
        launchUrlService.launchURL(url);
      } ,
      child:Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              icon,
              SizedBox(width: 8),
              Text(
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
