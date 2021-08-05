import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/screens/splash_screen.dart';


void main() {

  testWidgets('Splash page is created', (WidgetTester tester) async {
    final MaterialApp testWidget = MaterialApp(
      home: SplashScreen(),
    );

    await tester.pumpWidget(testWidget);
    expect(find.text('DEMO APP'), findsOneWidget);
  });

}