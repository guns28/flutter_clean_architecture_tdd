import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RatingTitle {

  String getRatingDescription(double rating, BuildContext context){
    if(rating == 6){
      return AppLocalizations.of(context)?.excellent ?? "Excellent";
    }else if(rating >= 5 && rating < 6){
      return AppLocalizations.of(context)?.very_good ?? "Very Good";
    }else if(rating >= 4 && rating < 5){
      return AppLocalizations.of(context)?.good ?? "Good";
    }else if(rating >= 3 && rating < 4){
      return AppLocalizations.of(context)?.average ?? "Average";
    }else if(rating >= 2 && rating < 3){
      return AppLocalizations.of(context)?.not_good ?? "Not Good";
    }else if(rating >= 1 && rating < 2){
      return AppLocalizations.of(context)?.awful ?? "Awful";
    }else{
      return AppLocalizations.of(context)?.awful ?? "Awful";
    }
  }
}