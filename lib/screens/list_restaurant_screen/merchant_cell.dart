import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MerchantCell extends StatelessWidget {

  const MerchantCell(
      {required this.id, required this.name, required this.imageUrl, required this.onTap});

  final String name;
  final String id;
  final String imageUrl;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => Container(
                    height: 175,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        )
                    ),
                  ),
                  placeholder: (BuildContext context, String url) => const CircularProgressIndicator(),
                  errorWidget: (BuildContext context, String url, dynamic error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 12),
                Text(name, style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),key: ValueKey(id),)
              ],
            ),
          )
      ),
    ),
    );
  }
}
