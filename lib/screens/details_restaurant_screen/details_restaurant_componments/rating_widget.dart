import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/globals/utilities.dart';

class RatingWidget {

  Widget ratingCell(String rating, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 8),
        Row(
          children: [
            Text(Utilities.getRatingDescription(double.parse(rating), context),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Utilities.getRatingColor(double.parse(rating)))),
            SizedBox(width: 20),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Utilities.getRatingColor(double.parse(rating)),
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