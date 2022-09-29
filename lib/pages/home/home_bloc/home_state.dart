part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitialS extends HomeState {}

class HomeFetchedS extends HomeState {
  final List<RequestModel> requests;
  HomeFetchedS(this.requests);

  @override
  List<Object> get props => [requests];
}