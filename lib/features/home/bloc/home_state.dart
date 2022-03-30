import 'package:equatable/equatable.dart';
import 'package:test_kulina/api/models/banner.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<Banner> banners;

  const HomeLoadedState(this.banners);

  @override
  List<Object?> get props => [banners];
}

class HomeLoadErrorState extends HomeState {
  final String message;

  const HomeLoadErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
