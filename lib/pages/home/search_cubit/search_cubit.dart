import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchOffS());
  void searching() {
    emit(SearchOnS());
  }

  void notSearching() {
    emit(SearchOffS());
  }
}
