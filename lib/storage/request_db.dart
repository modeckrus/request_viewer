import 'dart:async';
import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:request_model/request_model.dart';

import '../server/request_server.dart';
import 'request_storage.dart';

class RequestDb {
  late Isar isar;
  bool initialized = false;
  Future<void> initialize() async {
    if (initialized) {
      return;
    }
    try {
      isar = await Isar.open([
        RequestSSchema,
      ]);
      requestSubscription = RequestServer.requestStream.listen(_listen);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
    } finally {
      initialized = true;
    }
  }

  late StreamSubscription<RequestModel> requestSubscription;

  Future<void> close() async {
    await isar.close();
    await requestSubscription.cancel();
  }

  String? lastQuery;

  Future<List<RequestModel>> findRequests({String? query}) async {
    lastQuery = query;
    List<RequestS> result = [];
    if (query == null || query.isEmpty) {
      result = await findWithoutQuery();
    } else {
      result = await findWithQuery(query);
    }
    return result.map((e) => e.to_model()).toList();
  }

  Future<List<RequestS>> findWithoutQuery() async {
    return isar.requestSs.where().findAll();
  }

  Future<List<RequestS>> findWithQuery(String query) async {
    QueryBuilder<RequestS, RequestS, QAfterFilterCondition> qb =
        isar.requestSs.filter().contentWordsElementContains(query);
    var splitted = query.split(' ');
    for (var word in splitted) {
      qb = qb.or().contentWordsElementContains(word);
    }
    return qb.findAll();
  }

  Stream<List<RequestModel>> findRequestsStream() async* {
    await for (var _ in isar.requestSs.watchLazy(fireImmediately: true)) {
      yield await findRequests(query: lastQuery);
    }
  }

  Future<void> _listen(RequestModel event) async {
    isar.writeTxn<void>(() async {
      var request = RequestS.from_model(event);
      await isar.requestSs.put(request);
    });
  }

  Future<void> clear() async {
    final models = await isar.requestSs.where().idNotEqualTo(-1).findAll();
    final ids = models.map((e) => e.id).toList();
    await isar.writeTxn(() async {
      await isar.requestSs.deleteAll(ids);
    });
  }
}
