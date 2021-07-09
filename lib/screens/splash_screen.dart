import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'list_restaurant_screen/list_merchants_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ListMerchantScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implement build
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context)!.demo_app,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}