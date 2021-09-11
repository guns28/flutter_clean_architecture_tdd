import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/business_logic/merchant_cubit.dart';
import 'package:mobile_app_engineer/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dependency_injection/injector.dart';

void main() {
  Injector.setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
        BlocProvider(create: (BuildContext context) => Injector.resolve<MerchantCubit>()),
    ],
    child:MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
         Locale('en', ''), // English, no country code
         Locale('de', ''), // German, no country code
      ],
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),

      home: SplashScreen(),
        builder: EasyLoading.init()
      )
    );
  }
}
