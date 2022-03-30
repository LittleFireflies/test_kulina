import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_kulina/api/api_service.dart';
import 'package:test_kulina/repository/app_repository.dart';

import '../helpers/models.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('AppRepository', () {
    late ApiService apiService;
    late AppRepository repository;

    final banners = [TestModels.banner];

    setUp(() {
      apiService = MockApiService();
      repository = AppRepositoryImpl(apiService);
    });

    test('verify getBanners from apiService', () async {
      // arrange
      when(() => apiService.getBanners()).thenAnswer((_) async => banners);
      // act
      final result = await repository.loadBanners();
      // assert
      expect(result, banners);
      verify(() => apiService.getBanners()).called(1);
    });
  });
}
