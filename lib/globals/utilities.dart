import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

mixin Utilities {

  static Color getRatingColor(double rating){
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

  static String getRatingDescription(double rating, BuildContext context){
    if(rating == 6){
      return AppLocalizations.of(context)!.excellent;
    }else if(rating >= 5 && rating < 6){
      return AppLocalizations.of(context)!.very_good;
    }else if(rating >= 4 && rating < 5){
      return AppLocalizations.of(context)!.good;
    }else if(rating >= 3 && rating < 4){
      return AppLocalizations.of(context)!.average;
    }else if(rating >= 2 && rating < 3){
      return AppLocalizations.of(context)!.not_good;
    }else if(rating >= 1 && rating < 2){
      return AppLocalizations.of(context)!.awful;
    }else{
      return AppLocalizations.of(context)!.awful;
    }
  }

}