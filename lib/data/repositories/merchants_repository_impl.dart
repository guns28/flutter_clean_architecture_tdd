import 'package:dartz/dartz.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/core/network/network_info.dart';
import 'package:mobile_app_engineer/data/datasources/merchants/merchants_remote_data_source.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/domain/repositories/merchants_repository.dart';

class MerchantsRepositoryImpl extends MerchantsRepository {

  MerchantsRepositoryImpl({
    required this.merchantRemoteDataSource,
    required this.networkInfo,
  });

  late final MerchantsRemoteDataSource merchantRemoteDataSource;
  late final NetworkInfo networkInfo;

  List<Merchant> merchants = <Merchant>[];

  @override
  Future<Either<Failure, List<Merchant>>> getListMerchants(int nbMerchants) async {
    if (merchants.isNotEmpty) {
      return Right(merchants);
    } else if (await networkInfo.isConnected()) {
        try {
          final response = await merchantRemoteDataSource.fetchListMerchants(nbMerchants);
          return response.fold((Failure failure) => Left(failure), (List<Merchant> merchants) async {
            if (merchants.isNotEmpty) {
              return Right(merchants);
            }
            return Left(ServerFailure());
          });
        } on Exception catch (_) {
          return Left(ServerFailure());
        }
    } else {
      return Left(InternetFailure());
    }
  }
}

