import 'package:connectivity/connectivity.dart';
import 'package:kiwi/kiwi.dart';
import 'package:dio/dio.dart';
import 'package:mobile_app_engineer/core/api/merchant_api.dart';
import 'package:mobile_app_engineer/core/network/network_info.dart';
import 'package:mobile_app_engineer/data/datasources/merchants/merchants_remote_data_source.dart';
import 'package:mobile_app_engineer/data/repositories/merchants_repository_impl.dart';
import 'package:mobile_app_engineer/domain/repositories/merchants_repository.dart';
import 'package:mobile_app_engineer/domain/usecases/get_merchants.dart';
import 'package:mobile_app_engineer/logic/Rating/rating_color.dart';
import 'package:mobile_app_engineer/logic/Rating/rating_title.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/business_logic/merchant_cubit.dart';
import 'package:mobile_app_engineer/services/launch_url_service.dart';

part 'injector.g.dart';

abstract class Injector {

  static KiwiContainer container = KiwiContainer();
  static final resolve = container.resolve;

  static void setup() {
    _$Injector().configure();
  }

  // Core module
  void _configureArticlesFeatureModuleInstances() {
    container.registerInstance(
        MerchantRestClient(Dio(BaseOptions(contentType: "application/json"))));
  }

  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoInterface, from: NetworkInfo)
  @Register.factory(NetworkInfo)

  //merchant details
  @Register.singleton(LaunchUrlService)
  @Register.singleton(RatingColor)
  @Register.singleton(RatingTitle)

  //get merchants cubit
  @Register.factory(MerchantsRemoteDataSource, from: MerchantsRemoteDataSourceImpl)
  @Register.factory(MerchantsRepository, from: MerchantsRepositoryImpl)
  @Register.factory(GetMerchants)
  @Register.factory(MerchantCubit)
  void _configureCore();

  void configure(){
    _configureCore();
    _configureArticlesFeatureModuleInstances();
  }
}