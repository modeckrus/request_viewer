part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeOnRequestE extends HomeEvent {
  final List<RequestModel> requests;
  const HomeOnRequestE(this.requests);
}

class HomeClearE extends HomeEvent {}

class HomeInitializeE extends HomeEvent {}

class HomeSearchE extends HomeEvent {
  final String search;
  const HomeSearchE(this.search);
}
