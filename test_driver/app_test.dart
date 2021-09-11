import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Restaurant App Test -', () {
    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.clearTimeline();
      await driver.waitUntilFirstFrameRasterized();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('check flutter driver health', () async {
      final Health health = await driver.checkHealth();
      print(health.status);
    });

    test('verifies the merchants view list contains a specific merchant',
        () async {
      /// Merchants listview

      sleep(const Duration(seconds: 7));

      final SerializableFinder merchantList = find.byValueKey('merchant_list');
      final SerializableFinder merchantTextItem = find.byValueKey('10930');

      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(
          // Scroll through the list
          merchantList,
          merchantTextItem,
          dyScroll: -300.0,
        );

        expect(
            await driver.getText(merchantTextItem), 'Flavio Al Velavevodetto');
      });

      // Convert the Timeline into a TimelineSummary that's easier to
      // read and understand.
      final TimelineSummary summary = TimelineSummary.summarize(timeline);

      // Optionally, write the entire timeline to disk in a json format.
      // This file can be opened in the Chrome browser's tracing tools
      // found by navigating to chrome://tracing.
      await summary.writeTimelineToFile('scrolling_timeline', pretty: true);
    },
        timeout: const Timeout(
          Duration(seconds: 60),
        ));
  });
}
