import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Restaurant App Test -', () {
    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.clearTimeline();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
        driver.close();
    });

    test(
        'verifies the merchants view list contains a specific merchant',
        () async {
      /// Merchants listview

      final merchantList = find.byValueKey('merchant_list');
      final merchantTextItem = find.byValueKey('10930');

      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(
          // Scroll through the list
          merchantList,
          merchantTextItem,
          dyScroll: -1200.0,
        );

        expect(await driver.getText(merchantTextItem), 'Flavio Al Velavevodetto');

      });

      // Convert the Timeline into a TimelineSummary that's easier to
      // read and understand.
      final summary = TimelineSummary.summarize(timeline);

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
