import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request_model/request_model.dart';
import 'package:request_viewer/theme/theme.dart';

void setClipBoard(BuildContext context, String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: const Text('Copied to clipboard'),
    backgroundColor: MyTheme.of(context).greenColor,
  ));
}

class RequestPage extends StatelessWidget {
  final RequestModel model;
  const RequestPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.url),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(model.url),
            subtitle: const Text('URL'),
            onTap: () async {
              setClipBoard(context, model.url);
            },
          ),
          HeadersWidget(headers: model.headers),
          model.response != null
              ? InkWell(
                  onTap: () {
                    setClipBoard(context, model.response!);
                  },
                  child: Text(model.response ?? ''),
                )
              : const SizedBox.shrink(),
          model.stackTrace == null
              ? SizedBox.shrink()
              : ListTile(
                  title: Text('StackTrace'),
                  subtitle: Text(model.stackTrace ?? ''),
                )
        ],
      ),
    );
  }
}

class HeadersWidget extends StatelessWidget {
  final Map<String, String> headers;
  const HeadersWidget({super.key, required this.headers});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(const JsonEncoder.withIndent('\t').convert(headers)),
      subtitle: const Text('Headers'),
      onTap: () {
        setClipBoard(
            context, const JsonEncoder.withIndent('\t').convert(headers));
      },
    );
  }
}
