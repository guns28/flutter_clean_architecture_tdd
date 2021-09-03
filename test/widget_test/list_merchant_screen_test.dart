import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/list_merchants_screen.dart';

void main() {

  testWidgets('Show list merchant', (WidgetTester tester) async {
    final MaterialApp testWidget = MaterialApp(
      home: ListMerchantScreen(),
        builder: EasyLoading.init()
    );

    await tester.pumpWidget(testWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

}