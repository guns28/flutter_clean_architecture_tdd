import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'merchant_api.g.dart';

@RestApi(baseUrl: "https://api.quandoo.com/v1")
abstract class MerchantRestClient {
  factory MerchantRestClient(Dio dio, {String baseUrl}) = _MerchantRestClient;

  @GET("/merchants?limit={nbMerchants}")
  Future<ListMerchantsResponse> fetchMerchants(@Path('nbMerchants') int nbMerchants);
}
