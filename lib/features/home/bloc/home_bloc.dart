import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_kulina/features/home/bloc/home_event.dart';
import 'package:test_kulina/features/home/bloc/home_state.dart';
import 'package:test_kulina/repository/app_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRepository _repository;

  HomeBloc(AppRepository repository)
      : _repository = repository,
        super(const HomeLoadingState());
}
