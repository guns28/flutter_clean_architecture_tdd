import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/dependency_injection/injector.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/business_logic/merchant_cubit.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/list_merchants_screen.dart';

void main() {
  /*Injector.setup();

  testWidgets('Show list merchant', (WidgetTester tester) async {
    final testWidget = MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => Injector.resolve<MerchantCubit>()),
        ],
        child: MaterialApp(
            home: ListMerchantScreen(), builder: EasyLoading.init()));

    await tester.pumpWidget(testWidget);
    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(ListView), findsOneWidget);
  });*/
}
