part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchOffS extends SearchState {}

class SearchOnS extends SearchState {}
