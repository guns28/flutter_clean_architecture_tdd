import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/core/usecases/usecases.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import '../repositories/merchants_repository.dart';

class GetMerchants extends UseCase<List<Merchant>, MerchantsParams> {
  GetMerchants(this.repository);

  final MerchantsRepository repository;

  @override
  Future<Either<Failure, List<Merchant>>> call(MerchantsParams params) async {
    return await repository.getListMerchants(params.nbMerchants);
  }
}

class MerchantsParams extends Equatable {
  const MerchantsParams({required this.nbMerchants});

  final int nbMerchants;

  @override
  List<Object> get props => [nbMerchants];
}