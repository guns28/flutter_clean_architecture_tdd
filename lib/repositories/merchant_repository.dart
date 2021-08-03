import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:mobile_app_engineer/globals/constants.dart';
import 'package:mobile_app_engineer/models/list_merchants_response.dart';
import 'package:http/http.dart' as http;

abstract class MerchantRepositoryInterface {
  Future<List<Merchant>> fetchMerchants(int number);
}

class MerchantRepository implements MerchantRepositoryInterface {
  @override
  Future<List<Merchant>> fetchMerchants(int number) async {
    var url = "$baseUrl$listMerchants?limit=$number";

    final Response response = await http.get(Uri.parse(url));
    final jsonDecoded = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      return ListMerchantsResponse.fromJson(jsonDecoded).merchants ?? List<Merchant>.empty();
    }else{
      throw NetworkError();
    }
  }
}

class NetworkError extends Error {}
