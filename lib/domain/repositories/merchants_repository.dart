import 'package:dartz/dartz.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';

abstract class MerchantsRepository {
  Future<Either<Failure, List<Merchant>>> getListMerchants(int nbMerchants);
}

