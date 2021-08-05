import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/globals/Rating/rating_color.dart';
import 'package:mobile_app_engineer/globals/Rating/rating_title.dart';
import 'package:mobile_app_engineer/globals/ioc_container.dart';

class RatingWidget {

  Widget ratingCell(String rating, BuildContext context) {

    final RatingColor ratingColor = container.resolve<RatingColor>();
    final RatingTitle ratingTitle = container.resolve<RatingTitle>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            Text(ratingTitle.getRatingDescription(double.parse(rating), context),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ratingColor.getRatingColor(double.parse(rating)))),
            const SizedBox(width: 20),
            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: ratingColor.getRatingColor(double.parse(rating)),
                borderRadius: const BorderRadius.all( Radius.circular(16)),
              ),
              child: Text("$rating/6",
                  style: const TextStyle(
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