import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_kulina/features/home/bloc/home_bloc.dart';
import 'package:test_kulina/features/home/bloc/home_state.dart';
import 'package:test_kulina/repository/app_repository.dart';

class MockRepository extends Mock implements AppRepository {}

void main() {
  group('HomeBloc', () {
    late AppRepository repository;
    late HomeBloc bloc;

    setUp(() {
      repository = MockRepository();
      bloc = HomeBloc(repository);
    });

    test('initial state is HomeLoadingState', () {
      expect(bloc.state, const HomeLoadingState());
    });
  });
}
