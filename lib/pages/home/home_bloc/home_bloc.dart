import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:request_model/request_model.dart';
import 'package:super_validation/super_validation_string.dart';

import '../../../server/request_server.dart';
import '../../../storage/request_db.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingS()) {
    on<HomeInitializeE>(_initalize);
    on<HomeOnRequestE>(_onRequest);
    on<HomeClearE>(_onClear);
    on<HomeSearchE>(_search);
    searchSubscription ??= search.stream.listen(_listenSearch);
  }
  final SuperValidation search = SuperValidation();
  StreamSubscription<String>? searchSubscription;
  void initialize() {
    add(HomeInitializeE());
  }

  void clear() {
    add(HomeClearE());
  }

  void onRequest(List<RequestModel> models) {
    add(HomeOnRequestE(models));
  }

  late StreamSubscription<List<RequestModel>> dbSubscription;
  FutureOr<void> _onClear(HomeClearE event, Emitter<HomeState> emit) async {
    emit(HomeLoadingS());
    await db.clear();
    emit(HomeFetchedS([]));
  }

  RequestDb db = RequestDb();
  FutureOr<void> _initalize(
      HomeInitializeE event, Emitter<HomeState> emit) async {
    emit(HomeLoadingS());
    await db.initialize();
    dbSubscription = db.findRequestsStream().listen((event) {
      onRequest(event);
    });
  }

  FutureOr<void> _onRequest(HomeOnRequestE event, Emitter<HomeState> emit) {
    emit(HomeFetchedS(event.requests));
  }

  void _listenSearch(String search) {
    add(HomeSearchE(search));
  }

  FutureOr<void> _search(HomeSearchE event, Emitter<HomeState> emit) async {
    final requests = await db.findRequests(query: event.search);
    emit(HomeFetchedS(requests));
  }
}
