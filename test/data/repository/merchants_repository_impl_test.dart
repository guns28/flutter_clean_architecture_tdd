import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/core/api/merchant_api.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/core/network/network_info.dart';
import 'package:mobile_app_engineer/data/repositories/merchants_repository_impl.dart';
import 'package:mobile_app_engineer/dependency_injection/injector.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:mobile_app_engineer/data/datasources/merchants/merchants_remote_data_source.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';

import '../../mock_data/merchants_response_data.dart';
import 'merchants_repository_impl_test.mocks.dart';

class MerchantsRemoteDataSourceImplMock extends Mock
    implements MerchantsRemoteDataSourceImpl {}

@GenerateMocks([], customMocks: [
  MockSpec<MerchantsRemoteDataSourceImplMock>(returnNullOnMissingStub: true)])
void main() {

  final MockMerchantsRemoteDataSourceImplMock mockRemoteDatasource =
      MockMerchantsRemoteDataSourceImplMock();

  final MerchantsRepositoryImpl repository = MerchantsRepositoryImpl(
      merchantRemoteDataSource: mockRemoteDatasource
  );

  test(
      'should return merchants data when the call to MerchantsRemoteDataSourceImpl client is successful',
      () async {
    // arrange
    when(mockRemoteDatasource.fetchListMerchants(1))
        .thenAnswer((_) async => Right(merchantMockResponse.merchants!));

    // act
    final result = await repository.getListMerchants(1);

    // assert
    expect(result, Right(merchantMockResponse.merchants));
    verify(mockRemoteDatasource.fetchListMerchants(1));
    verifyNoMoreInteractions(mockRemoteDatasource);
  });

  test(
      'should return failure when the call to MerchantsRemoteDataSourceImpl ends with Exception',
      () async {
    // arrange
    when(mockRemoteDatasource.fetchListMerchants(1))
        .thenThrow(DioError(requestOptions: RequestOptions(path: 'GET')));

    // act
    final result = await repository.getListMerchants(1);

    // assert
    expect(result, Left(ServerFailure()));
    verify(mockRemoteDatasource.fetchListMerchants(1));
    verifyNoMoreInteractions(mockRemoteDatasource);
  });
}
