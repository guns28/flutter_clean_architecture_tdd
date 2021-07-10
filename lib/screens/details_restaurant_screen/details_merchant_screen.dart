import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/globals/constants.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/screens/details_restaurant_screen/details_restaurant_componments/days_widget.dart';
import 'package:mobile_app_engineer/screens/details_restaurant_screen/details_restaurant_componments/rating_widget.dart';
import 'package:mobile_app_engineer/screens/details_restaurant_screen/details_restaurant_componments/website_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'details_restaurant_componments/phone_widget.dart';

class DetailMerchantScreen extends StatefulWidget {
  final Merchant merchant;
  DetailMerchantScreen(this.merchant);

  @override
  State<StatefulWidget> createState() {
    return new DetailMerchantScreenState();
  }
}

class DetailMerchantScreenState extends State<DetailMerchantScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(widget.merchant.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            SizedBox(height: 16),
            Flexible(
              child: Stack(
                children: <Widget>[
                  widget.merchant.images != null && widget.merchant.images!.length > 0 ?
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true, enlargeCenterPage: true),
                    items: widget.merchant.images!
                        .map(
                          (item) => CachedNetworkImage(
                            imageUrl: item.url,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 175,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )
                        .toList(),
                  ) : SizedBox(),
                  SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      clipBehavior: Clip.none,
                      child: Column(children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(32),
                                    topLeft: Radius.circular(32),
                                  ),
                                  color: Colors.white),
                              margin:  widget.merchant.images != null && widget.merchant.images!.length > 0 ? EdgeInsets.only(top: 266, bottom: 40) : EdgeInsets.only(top: 20, bottom: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RatingWidget().ratingCell(widget.merchant.reviewScore, context),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Divider(color: orange)),
                                  Text(AppLocalizations.of(context)!.about,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: orange)),
                                  SizedBox(height: 8),
                                  WebsiteWidget().websiteCell(Icon(Icons.link, size: 32), widget.merchant.links != null && widget.merchant.links!.length > 0 ? widget.merchant.links!.first.href : ""),
                                  PhoneWidget().phoneCell(Icon(Icons.phone, size: 32), widget.merchant.phoneNumber),
                                  _addressCell(
                                      Icon(Icons.location_on, size: 32),
                                      "${widget.merchant.location.address.street} ${widget.merchant.location.address.district},  ${widget.merchant.location.address.zipcode} ${widget.merchant.location.address.city} "),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Divider(color: orange)),
                              Row(
                                children: [
                                  Icon(Icons.access_time),
                                  SizedBox(width: 8),
                                  Text(AppLocalizations.of(context)!.open_today,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: orange))
                                ]
                              ),
                                  SizedBox(height: 8),
                                  DaysWidget().daysCell(widget.merchant.openingTimes.standardOpeningTimes)
                                ],
                              ),
                            )
                          ],
                        ),
                      ]))
                ],
              ),
            )
          ],
        ) /* add child content here */
            ));
  }

  Widget _addressCell(Icon icon, String title) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            icon,
            SizedBox(width: 8),
            Container(
                width: MediaQuery.of(context).size.width - 80,
                child: Text(
                  title,
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ))
          ],
        ));
  }
  
}
