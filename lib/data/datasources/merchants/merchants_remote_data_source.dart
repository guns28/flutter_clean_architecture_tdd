import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:mobile_app_engineer/core/api/merchant_api.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:dio/dio.dart';

abstract class MerchantsRemoteDataSource {
  Future<Either<Failure, List<Merchant>>> fetchListMerchants(int number);
}

class MerchantsRemoteDataSourceImpl implements MerchantsRemoteDataSource {

  MerchantsRemoteDataSourceImpl({required this.client});
  final MerchantRestClient client;

  @override
  Future<Either<Failure, List<Merchant>>> fetchListMerchants(int number) async {
    try {
      final ListMerchantsResponse merchantsResponse = await client.fetchMerchants(number);

      if(merchantsResponse.merchants != null && merchantsResponse.merchants!.isNotEmpty){
        return Right(merchantsResponse.merchants!);
      }
      return Left(ServerFailure());
    } on DioError {
      return Left(ServerFailure());
    }
  }
}
