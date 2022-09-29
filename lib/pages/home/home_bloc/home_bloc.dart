import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:request_model/request_model.dart';

import '../../../server/request_server.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialS()) {
    on<HomeOnRequestE>(_onRequest);
    on<HomeClearE>(_onClear);
    requestSubscription = RequestServer.requestStream.listen(_listen);
  }
  late StreamSubscription<RequestModel> requestSubscription;

  @override
  Future<void> close() async {
    await requestSubscription.cancel();
    return super.close();
  }

  void _listen(RequestModel event) {
    add(HomeOnRequestE(event));
  }

  FutureOr<void> _onRequest(HomeOnRequestE event, Emitter<HomeState> emit) {
    var list = <RequestModel>[];
    final currentState = state;
    if (currentState is HomeFetchedS) {
      list.addAll(currentState.requests);
    }
    list.add(event.requestModel);
    emit(HomeFetchedS(list));
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    final list = (json['requests'] as List)
        .map((e) => RequestModel.fromJson(e))
        .toList();
    return HomeFetchedS(list);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    if (state is HomeFetchedS) {
      return {'requests': state.requests.map((e) => e.toJson()).toList()};
    }
    return null;
  }

  FutureOr<void> _onClear(HomeClearE event, Emitter<HomeState> emit) {
    emit(HomeInitialS());
  }
}
