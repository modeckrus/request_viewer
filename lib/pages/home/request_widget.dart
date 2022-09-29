import 'package:flutter/material.dart';
import 'package:request_model/request_model.dart';
import 'package:request_viewer/navigator/app_routes.dart';
import 'package:request_viewer/theme/theme.dart';

class RequestWidget extends StatelessWidget {
  final RequestModel model;
  const RequestWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var headers = {...model.headers};
    headers.remove('Authorization');
    headers.remove('User-Agent');
    headers.remove('Accept-Encoding');
    headers.remove('content-type');
    headers.remove('content-length');
    return ListTile(
      title: Text(model.url),
      subtitle: Text(headers.toString()),
      trailing: Text(model.type.toString()),
      tileColor: model.isError ? MyTheme.of(context).redColor : null,
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.requestPage, arguments: model);
      },
    );
  }
}
