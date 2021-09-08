import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';
import 'package:mobile_app_engineer/data/repositories/merchants_repository_impl.dart';
import 'package:mobile_app_engineer/domain/usecases/get_merchants.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_data/merchants_response_data.dart';
import 'get_merchants_test.mocks.dart';

class MerchantsRepositoryImplMock extends Mock implements MerchantsRepositoryImpl {}

@GenerateMocks([], customMocks: [
  MockSpec<MerchantsRepositoryImplMock>(returnNullOnMissingStub: true)])
void main() {

  final MockMerchantsRepositoryImplMock mockMerchantRepository =
  MockMerchantsRepositoryImplMock();

  GetMerchants getMerchants = GetMerchants(mockMerchantRepository);

  test('should get remote merchants from the repository', () async {
    // arrange
    when(mockMerchantRepository.getListMerchants(1))
        .thenAnswer((_) => Future.value(Right(merchantMockResponse.merchants!)));

    // act
    final result = await getMerchants.call(const MerchantsParams(nbMerchants: 1));

    // assert
    expect(result, Right(merchantMockResponse.merchants!));
    verify(mockMerchantRepository.getListMerchants(1));
    verifyNoMoreInteractions(MockMerchantsRepositoryImplMock());
  });

  test('should get Failure from the repository', () async {
    // arrange
    when(mockMerchantRepository.getListMerchants(1))
        .thenAnswer((_) => Future.value(Left(ServerFailure())));

    // act
    final result = await getMerchants.call(const MerchantsParams(nbMerchants: 1));

    // assert
    expect(result, Left(ServerFailure()));
    verify(mockMerchantRepository.getListMerchants(1));
    verifyNoMoreInteractions(MockMerchantsRepositoryImplMock());
  });

}
