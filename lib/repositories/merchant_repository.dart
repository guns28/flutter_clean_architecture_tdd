import 'dart:convert';

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
    final String url = "$baseUrl$listMerchants?limit=$number";

    final Response response = await http.get(Uri.parse(url));
    final Map<String, dynamic> jsonDecoded = json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return ListMerchantsResponse.fromJson(jsonDecoded).merchants ?? List<Merchant>.empty();
    }else{
      throw Exception();
    }
  }
}
