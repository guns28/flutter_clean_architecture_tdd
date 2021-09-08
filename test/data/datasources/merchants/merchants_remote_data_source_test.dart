import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/core/api/merchant_api.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:mobile_app_engineer/data/datasources/merchants/merchants_remote_data_source.dart';
import 'package:mobile_app_engineer/data/models/list_merchants_response.dart';

import '../../../mock_data/merchants_response_data.dart';
import 'merchants_remote_data_source_test.mocks.dart';

class MerchantRestClientMock extends Mock implements MerchantRestClient {}

@GenerateMocks([], customMocks: [MockSpec<MerchantRestClientMock>(returnNullOnMissingStub: true)])

void main() {

  final MockMerchantRestClientMock mockMerchantClient = MockMerchantRestClientMock();
  final MerchantsRemoteDataSourceImpl remoteDatasource = MerchantsRemoteDataSourceImpl(client: mockMerchantClient);

  test('should return merchants data when the call to rest client is successful',
          () async {
            // arrange
        when(mockMerchantClient.fetchMerchants(1))
            .thenAnswer((_) async => Future.value(merchantMockResponse));

        // act
        final result = await remoteDatasource.fetchListMerchants(1);

        // assert
        expect(result, Right(merchantMockResponse.merchants));
        verify(mockMerchantClient.fetchMerchants(1));
        verifyNoMoreInteractions(mockMerchantClient);
  });

  test('should return failure when the call to rest client ends with Exception',
          () async {
        // arrange
        when(mockMerchantClient.fetchMerchants(1))
            .thenThrow(DioError(requestOptions: RequestOptions( path: 'GET')));

        // act
        final result = await remoteDatasource.fetchListMerchants(1);

        // assert
        expect(result, Left(ServerFailure()));
        verify(mockMerchantClient.fetchMerchants(1));
        verifyNoMoreInteractions(mockMerchantClient);
  });

}
