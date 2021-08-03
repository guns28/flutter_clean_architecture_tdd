import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';


class RatingColor {
  Color getRatingColor(double rating){
    if(rating == 6){
      return Colors.green;
    }else if(rating >= 5 && rating < 6){
      return Colors.lightGreen;
    }else if(rating >= 4 && rating < 5){
      return Colors.lightGreenAccent;
    }else if(rating >= 3 && rating < 4){
      return Colors.orangeAccent;
    }else if(rating >= 2 && rating < 3){
      return Colors.orange;
    }else if(rating >= 1 && rating < 2){
      return Colors.deepOrangeAccent;
    }else{
      return Colors.red;
    }
  }
}