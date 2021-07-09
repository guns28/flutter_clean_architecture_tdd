import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MerchantCell extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Function onTap;

  const MerchantCell(
      {required this.name, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },child: Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 175,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        )),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 12),
                Text(name, style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ))
              ],
            ),
          )),
    ),
    );
  }
}
