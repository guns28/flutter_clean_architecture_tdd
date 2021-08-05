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
  const DetailMerchantScreen(this.merchant);
  final Merchant merchant;

  @override
  State<StatefulWidget> createState() {
    return DetailMerchantScreenState();
  }
}


class DetailMerchantScreenState extends State<DetailMerchantScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(widget.merchant.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Flexible(
              child: Stack(
                children: <Widget>[
                  if (widget.merchant.images != null && widget.merchant.images!.isNotEmpty) CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true, enlargeCenterPage: true),
                    items: widget.merchant.images!
                        .map(
                          (item) => CachedNetworkImage(
                            imageUrl: item.url,
                            imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => Container(
                              height: 175,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            placeholder: (BuildContext context, String url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (BuildContext context, String url, error) =>
                                const Icon(Icons.error),
                          ),
                        )
                        .toList(),
                  ) else const SizedBox(),
                  SingleChildScrollView(
                      controller: _scrollController,
                      clipBehavior: Clip.none,
                      child: Column(children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(32),
                                    topLeft: Radius.circular(32),
                                  ),
                                  color: Colors.white),
                              margin:  widget.merchant.images != null && widget.merchant.images!.isNotEmpty
                                  ? const EdgeInsets.only(top: 266, bottom: 40)
                                  : const EdgeInsets.only(top: 20, bottom: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RatingWidget().ratingCell(widget.merchant.reviewScore, context),
                                  Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 12),
                                      child: Divider(color: orange)),
                                  Text(AppLocalizations.of(context)!.about,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: orange)),
                                  const SizedBox(height: 8),
                                  WebsiteWidget().websiteCell(const Icon(Icons.link, size: 32), widget.merchant.links != null && widget.merchant.links!.isNotEmpty ? widget.merchant.links!.first.href : ""),
                                  PhoneWidget().phoneCell(const Icon(Icons.phone, size: 32), widget.merchant.phoneNumber),
                                  _addressCell(
                                      const Icon(Icons.location_on, size: 32),
                                      '${widget.merchant.location.address.street} ${widget.merchant.location.address.district},  ${widget.merchant.location.address.zipcode} ${widget.merchant.location.address.city} '),
                                  Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 12),
                                      child: Divider(color: orange)),
                              Row(
                                children: [
                                  const Icon(Icons.access_time),
                                  const SizedBox(width: 8),
                                  Text(AppLocalizations.of(context)!.open_today,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: orange))
                                ]
                              ),
                                  const SizedBox(height: 8),
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
            );
  }

  Widget _addressCell(Icon icon, String title) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: Text(
                  title,
                  maxLines: 3,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                )
            )
          ],
        ));
  }
  
}
