import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:request_model/request_model.dart';
part 'request_storage.g.dart';

@collection
class RequestS {
  Id id = Isar.autoIncrement;
  late String url;
  late List<MapEntryS> headers;
  late List<MapEntryS> bodyMap;
  late String body;
  late String? response;
  late bool isError;
  late String? stackTrace;
  @Enumerated(EnumType.name)
  late RequestTypeE type;
  @Index(type: IndexType.value, caseSensitive: false)
  RequestS();
  List<String> get contentWords {
    final urlWords = url.split('/');
    var headerWords = <String>[];
    headers.forEach((element) {
      headerWords.addAll(parseHeaderWord(element));
    });

    var result = [
      ...urlWords,
      ...headerWords,
    ];
    headers.forEach((element) {
      headerWords.addAll(parseHeaderWord(element));
    });
    return result;
  }

  static List<String> parseHeaderWord(MapEntryS entry) {
    var result = <String>[];
    result.addAll(entry.key.split('-'));
    result.addAll(entry.value.split('-'));
    return result;
  }

  RequestModel to_model() {
    final headers = <String, String>{};
    this.headers.forEach((element) {
      headers[element.key] = element.value;
    });
    dynamic parsedBody;
    try {
      parsedBody = jsonDecode(body);
    } catch (e) {
      print(e);
    }
    return RequestModel(
        type: this.type,
        url: this.url,
        headers: headers,
        isError: this.isError,
        body: parsedBody,
        response: this.response,
        stackTrace: this.stackTrace);
  }

  factory RequestS.from_model(RequestModel model) {
    final headers = <MapEntryS>[];
    model.headers.forEach((key, value) {
      var header = MapEntryS();
      header.key = key;
      header.value = value;
      headers.add(header);
    });
    final parsedBody = <MapEntryS>[];
    model.body?.forEach((key, value) {
      var b = MapEntryS();
      b.key = key;

      b.value = "$value";
      parsedBody.add(b);
    });
    var result = RequestS();
    result.type = model.type;
    result.url = model.url;
    result.headers = headers;
    result.isError = model.isError;
    try {
      result.body = jsonEncode(parsedBody);
    } catch (e) {
      print(e);
    }
    result.bodyMap = parsedBody;
    result.response = model.response;
    result.stackTrace = model.stackTrace;
    return result;
  }
}

@embedded
class MapEntryS {
  late String key;
  late String value;
}
