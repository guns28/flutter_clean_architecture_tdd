import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/logic/Rating/rating_title.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {

  final MockBuildContext _context = MockBuildContext();

  test('Get the Correct title for rating', () {
    final RatingTitle title = RatingTitle();

    expect(title.getRatingDescription(6, _context), "Excellent");
    expect(title.getRatingDescription(5, _context), "Very Good");
    expect(title.getRatingDescription(4, _context), "Good");
    expect(title.getRatingDescription(3, _context), "Average");
    expect(title.getRatingDescription(2, _context), "Not Good");
    expect(title.getRatingDescription(1, _context), "Awful");
    expect(title.getRatingDescription(0, _context), "Awful");
    expect(title.getRatingDescription(-1, _context), "Awful");

  });

}