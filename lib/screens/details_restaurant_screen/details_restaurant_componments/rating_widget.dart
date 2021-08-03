import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/globals/Rating/RatingColor.dart';
import 'package:mobile_app_engineer/globals/Rating/RatingTitle.dart';
import 'package:mobile_app_engineer/globals/ioc_container.dart';

class RatingWidget {

  Widget ratingCell(String rating, BuildContext context) {

    final ratingColor = container.resolve<RatingColor>();
    final ratingTitle = container.resolve<RatingTitle>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 8),
        Row(
          children: [
            Text(ratingTitle.getRatingDescription(double.parse(rating), context),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ratingColor.getRatingColor(double.parse(rating)))),
            SizedBox(width: 20),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: ratingColor.getRatingColor(double.parse(rating)),
                borderRadius:
                BorderRadius.all(Radius.circular(16)),
              ),
              child: Text("$rating/6",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white)),
            ),
          ],
        )
      ],
    );
  }

}