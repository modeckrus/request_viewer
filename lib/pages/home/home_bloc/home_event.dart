part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeOnRequestE extends HomeEvent {
  final RequestModel requestModel;
  const HomeOnRequestE(this.requestModel);
}

class HomeClearE extends HomeEvent {}