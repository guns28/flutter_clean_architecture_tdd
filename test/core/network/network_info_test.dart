import 'package:connectivity/connectivity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_engineer/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

class ConnectivityMock extends Mock implements Connectivity {}

@GenerateMocks([ConnectivityMock])

void main() {
  final MockConnectivityMock connectivity = MockConnectivityMock();
  final NetworkInfoInterface networkInfo = NetworkInfo(connectivity: connectivity);

    test(
      'Should Check internet connexion, return true if result is wifi / mobile, else return false',
          () async {
        // arrange
        when(connectivity.checkConnectivity())
            .thenAnswer((_) => Future.value(ConnectivityResult.wifi));

        // act
        final bool result = await networkInfo.isConnected();

        // assert
        verify(connectivity.checkConnectivity());
        expect(result, true);
      });
}

