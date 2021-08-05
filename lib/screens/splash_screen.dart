import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'list_restaurant_screen/list_merchants_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  late Timer navigationTimer;

  @override
  void initState() {
    super.initState();
    navigationTimer = Timer(const Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ListMerchantScreen()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    navigationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implement build
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context)?.demo_app ?? "DEMO APP" ,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}