import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';

class DetailMerchantScreen extends StatefulWidget {

  final Merchant merchant;
  DetailMerchantScreen(this.merchant);

  @override
  State<StatefulWidget> createState() {
    return new DetailMerchantScreenState();
  }
}

class DetailMerchantScreenState extends State<DetailMerchantScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.merchant.name, style: TextStyle(color: Colors.white, fontSize: 24,
              fontWeight: FontWeight.bold)),
        ),
        body: Container());
  }


}