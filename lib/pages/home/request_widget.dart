import 'package:flutter/material.dart';
import 'package:request_model/request_model.dart';
import 'package:request_viewer/navigator/app_routes.dart';


class RequestWidget extends StatelessWidget {
  final RequestModel model;
  const RequestWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.url),
      subtitle: Text(model.response ?? ''),
      trailing: Text(model.type.toString()),
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.requestPage, arguments: model);
      },
    );
  }
}
