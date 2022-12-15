import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:request_model/request_model.dart';
import 'package:request_viewer/pages/request/text_widget.dart';

import '../../theme/theme.dart';
import 'request_page.dart';

class CurlWidget extends StatelessWidget {
  final RequestModel model;
  final bool convertFormData;
  const CurlWidget(
      {super.key, this.convertFormData = true, required this.model});
  RequestOptions toRequestOptions(RequestModel model) {
    return RequestOptions(
      method: RequestTypeEExt.map[model.type]!,
      headers: model.headers,
      data: model.body,
      path: model.url,
    );
  }

  String get text => _cURLRepresentation(toRequestOptions(model));

  @override
  Widget build(BuildContext context) {
    return TextWidget(lable: 'CURL', text: text);
  }

  String _cURLRepresentation(RequestOptions options) {
    List<String> components = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      // FormData can't be JSON-serialized, so keep only their fields attributes
      if (options.data is FormData && convertFormData == true) {
        options.data = Map.fromEntries(options.data.fields);
      }

      final data = json.encode(options.data).replaceAll('"', '\\"');
      components.add('-d "$data"');
    }

    components.add('"${options.uri.toString()}"');

    return components.join(' \\\n\t');
  }
}
