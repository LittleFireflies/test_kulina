import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_kulina/features/home/bloc/home_bloc.dart';
import 'package:test_kulina/features/home/bloc/home_event.dart';
import 'package:test_kulina/features/home/bloc/home_state.dart';
import 'package:test_kulina/repository/app_repository.dart';

import '../../../helpers/models.dart';

class MockRepository extends Mock implements AppRepository {}

void main() {
  group('HomeBloc', () {
    late AppRepository repository;
    late HomeBloc bloc;

    final banners = [TestModels.banner];

    setUp(() {
      repository = MockRepository();
      bloc = HomeBloc(repository);
    });

    tearDownAll(() {
      verifyNoMoreInteractions(repository);
    });

    test('initial state is HomeLoadingState', () {
      expect(bloc.state, const HomeLoadingState());
    });

    blocTest<HomeBloc, HomeState>(
      'emits HomeLoadedState '
      'when LoadHomeBanners is added '
      'and returns success',
      setUp: () {
        when(() => repository.loadBanners()).thenAnswer((_) async => banners);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const LoadHomeBanners()),
      expect: () => [
        const HomeLoadingState(),
        HomeLoadedState(banners),
      ],
      verify: (_) {
        verify(() => repository.loadBanners()).called(1);
      },
    );
  });
}
