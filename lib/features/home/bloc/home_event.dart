import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadHomeBanners extends HomeEvent {
  const LoadHomeBanners();

  @override
  List<Object?> get props => [];
}
