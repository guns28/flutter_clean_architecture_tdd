import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/domain/entities/opening_day_model.dart';

class DaysWidget {

  Widget daysCell(StandardOpeningTimes standardOpeningTimes) {
    final List<OpeningDayModel> listDays = [];

    standardOpeningTimes.toJson().forEach((String key, dynamic value) {
      if(value != null){
        List<Day>? day = value as List<Day>;
        listDays.add(OpeningDayModel(key, day.first.start, day.first.end));
      }
    });

    return Column(
      children: [
        for(OpeningDayModel day in listDays)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day.day,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),const SizedBox(width: 16),
                  Row(
                    children: [
                      Text(
                        day.start,
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                      const Text(
                        " - ",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                      Text(
                        day.end,
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      )
                    ],
                  )
                ],
              ))
      ],
    );
  }
}