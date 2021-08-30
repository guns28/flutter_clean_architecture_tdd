import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:mobile_app_engineer/logic/Rating/rating_color.dart';

void main() {
    test('Get the Correct Color for rating', () {
      final RatingColor color = RatingColor();

      expect(color.getRatingColor(1), Colors.deepOrangeAccent);
      expect(color.getRatingColor(2), Colors.orange);
      expect(color.getRatingColor(3), Colors.orangeAccent);
      expect(color.getRatingColor(4), Colors.lightGreenAccent);
      expect(color.getRatingColor(5), Colors.lightGreen);
      expect(color.getRatingColor(6), Colors.green);
      expect(color.getRatingColor(0.5), Colors.red);
      expect(color.getRatingColor(-1), Colors.red);
    });
}