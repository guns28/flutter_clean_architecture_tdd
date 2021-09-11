import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/core/errors/failure.dart';
import 'package:mobile_app_engineer/core/network/network_info.dart';
import 'package:mobile_app_engineer/domain/usecases/get_merchants.dart';
import 'package:mobile_app_engineer/screens/list_restaurant_screen/business_logic/merchant_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_data/merchants_response_data.dart';
import 'merchant_cubit_test.mocks.dart';

class GetMerchantsMock extends Mock implements GetMerchants {}

class NetworkInfoMock extends Mock implements NetworkInfo {}

@GenerateMocks([], customMocks: [
  MockSpec<GetMerchantsMock>(returnNullOnMissingStub: true),
  MockSpec<NetworkInfoMock>(returnNullOnMissingStub: true)
])
void main() {
  final MockGetMerchantsMock getMerchantsMock = MockGetMerchantsMock();
  final MockNetworkInfoMock networkInfoMock = MockNetworkInfoMock();

  final MerchantCubit merchantCubit =
      MerchantCubit(getMerchantsMock, networkInfoMock);

  final MerchantCubit merchantFailCubit =
  MerchantCubit(getMerchantsMock, networkInfoMock);

  final MerchantCubit merchantInternetFailCubit =
  MerchantCubit(getMerchantsMock, networkInfoMock);

  group('merchant list fetch ', () {

    blocTest(
      'should emits [MerchantInitial, GetMerchantsListState] when cubit.merchantsGet is called succesfuly.',
      build: () {
        when(networkInfoMock.isConnected())
            .thenAnswer((_) => Future.value(true));
        when(getMerchantsMock.call(const MerchantsParams(nbMerchants: 1)))
            .thenAnswer(
                (_) => Future.value(Right(merchantMockResponse.merchants!)));
        return merchantCubit;
      },
      act: (MerchantCubit cubit) => cubit.merchantsGet(nbMerchants: 1),
      expect: () => [
        MerchantInitial(),
        GetMerchantsListState(merchantMockResponse.merchants!)
      ],
      verify: (_) {
        verifyInOrder([
          networkInfoMock.isConnected(),
          getMerchantsMock.call(const MerchantsParams(nbMerchants: 1))
        ]);
        verifyNoMoreInteractions(networkInfoMock);
        verifyNoMoreInteractions(getMerchantsMock);
      },
       tearDown: (){
         merchantCubit.close();
       }
    );

    blocTest(
      'should emits [MerchantInitial, ErrorState] when cubit.merchantsGet is called fail.',
      build: () {
        when(networkInfoMock.isConnected())
            .thenAnswer((_) => Future.value(true));
        when(getMerchantsMock.call(const MerchantsParams(nbMerchants: 1)))
            .thenAnswer((_) => Future.value(Left(ServerFailure())));

        return merchantFailCubit;
      },
      act: (MerchantCubit cubit) => cubit.merchantsGet(nbMerchants: 1),
      expect: () => [MerchantInitial(), ErrorState(FailureMessage.server)],
      verify: (_) {
        verifyInOrder([
          networkInfoMock.isConnected(),
          getMerchantsMock.call(const MerchantsParams(nbMerchants: 1))
        ]);
        verifyNoMoreInteractions(networkInfoMock);
        verifyNoMoreInteractions(getMerchantsMock);
      },tearDown: (){
      merchantFailCubit.close();
    }
    );

    blocTest(
      'should emits [MerchantInitial, ErrorState] when cubit.merchantsGet is called with no internet connexion.',
      build: () {
        when(networkInfoMock.isConnected())
            .thenAnswer((_) => Future.value(false));
        when(networkInfoMock.onConnectivityChanged)
            .thenAnswer((_) => Stream.fromIterable([ConnectivityResult.none]));
        return merchantInternetFailCubit;
      },
      act: (MerchantCubit cubit) => cubit.merchantsGet(nbMerchants: 1),
      expect: () => [MerchantInitial(), ErrorState(FailureMessage.internet)],
      verify: (_) {
        verifyInOrder([
          networkInfoMock.isConnected(),
        ]);
        verifyNoMoreInteractions(networkInfoMock);
      },
    );
  });
}
