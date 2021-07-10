import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_engineer/globals/constants.dart';
import 'package:mobile_app_engineer/globals/utilities.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/models/opening_day_model.dart';
import 'package:url_launcher/url_launcher.dart';


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
                  ),
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
                              margin: EdgeInsets.only(top: 266, bottom: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _ratingCell(widget.merchant.reviewScore),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Divider(color: orange)),
                                  Text("About",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: orange)),
                                  SizedBox(height: 8),
                                  _linkCell(
                                      Icon(Icons.link, size: 32), widget.merchant.links!.first.href),
                                  _phoneCell(Icon(Icons.phone, size: 32),
                                      widget.merchant.phoneNumber),
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
                                  Text("Open Today",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: orange))
                                ]
                              ),
                                  SizedBox(height: 8),
                                _daysCell(widget.merchant.openingTimes.standardOpeningTimes)
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

  Widget _daysCell(StandardOpeningTimes standardOpeningTimes) {

    List<OpeningDayModel> listDays = [];

    standardOpeningTimes.toJson().forEach((key, value) {
      if(value != null){
        List<Day>? day = value as List<Day>;
        listDays.add(OpeningDayModel(key, day.first.start, day.first.end));
      }else{
        listDays.add(OpeningDayModel(key, "N/A", "N/A"));
      }
    });
    
    return Column(
      children: [
        for(OpeningDayModel day in listDays)
      Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                day.day,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),SizedBox(width: 16),
              Row(
                children: [
                  Text(
                    day.start,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  Text(
                    " - ",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  Text(
                    day.end,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  )
                ],
              )
            ],
          ))
      ],
    );

  }

  Widget _phoneCell(Icon icon, String title) {
    return GestureDetector(
      onTap: (){
        _launchURL("tel:$title");
      } ,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              icon,
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              )
            ],
          )
      ),
    );
  }

  Widget _linkCell(Icon icon, String url) {
    return GestureDetector(
      onTap: (){
        _launchURL(url);
      } ,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              icon,
              SizedBox(width: 8),
              Text(
                "Website",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              )
            ],
          )
      ),
    );
  }

  Widget _ratingCell(String rating){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 8),
        Row(
          children: [
            Text(Utilities.getRatingDescription(double.parse(rating)),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Utilities.getRatingColor(double.parse(rating)))),
            SizedBox(width: 20),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Utilities.getRatingColor(double.parse(rating)),
                borderRadius:
                BorderRadius.all(Radius.circular(16)),
              ),
              child: Text("$rating/6",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white)),
            ),
          ],
        )
      ],
    );
  }

  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
