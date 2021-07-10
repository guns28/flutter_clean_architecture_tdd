import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/models/opening_day_model.dart';

class DaysWidget {

  Widget daysCell(StandardOpeningTimes standardOpeningTimes) {
    List<OpeningDayModel> listDays = [];

    standardOpeningTimes.toJson().forEach((key, value) {
      if(value != null){
        List<Day>? day = value as List<Day>;
        listDays.add(OpeningDayModel(key, day.first.start, day.first.end));
      }
    });

    return Column(
      children: [
        for(OpeningDayModel day in listDays)
          Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day.day,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),SizedBox(width: 16),
                  Row(
                    children: [
                      Text(
                        day.start,
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                      Text(
                        " - ",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                      Text(
                        day.end,
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      )
                    ],
                  )
                ],
              ))
      ],
    );
  }
}