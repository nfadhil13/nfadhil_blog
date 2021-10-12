import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nfadhil_blog/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([DataConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('Should Forward the call to data connection checker', () async {
      final expected = Future.value(true);
      when(networkInfoImpl.isConnected)
          .thenAnswer((realInvocation) => expected);
      final result = networkInfoImpl.isConnected;
      verify(networkInfoImpl.isConnected);
      expect(result, expected);
    });
  });
}
