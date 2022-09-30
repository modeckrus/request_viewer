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

class RequestPage extends StatefulWidget {
  final RequestModel model;
  const RequestPage({super.key, required this.model});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.url),
        bottom: TabBar(tabs: [
          Tab(text: 'Request'),
          Tab(text: 'Response'),
          Tab(text: 'StackTrace'),
        ], controller: _tabController),
      ),
      body: TabBarView(controller: _tabController, children: [
        ListView(
          children: [
            ListTile(
              title: Text(widget.model.url),
              subtitle: const Text('URL'),
              onTap: () async {
                setClipBoard(context, widget.model.url);
              },
            ),
            HeadersWidget(headers: widget.model.headers),
            widget.model.body != null
                ? ListTile(
                    onTap: () {
                      setClipBoard(
                          context,
                          JsonEncoder.withIndent('\t')
                              .convert(widget.model.body!));
                    },
                    title: Text(JsonEncoder.withIndent('\t')
                        .convert(widget.model.body!)),
                    subtitle: const Text('Body'),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        ResponseWidget(
          response: widget.model.response ?? '',
        ),
        StacktraceWidget(
          stackTrace: widget.model.stackTrace ?? '',
        ),
      ]),
    );
  }
}

class StacktraceWidget extends StatelessWidget {
  final String stackTrace;
  const StacktraceWidget({super.key, required this.stackTrace});

  @override
  Widget build(BuildContext context) {
    return stackTrace == null
        ? SizedBox.shrink()
        : ListTile(
            title: Text('StackTrace'),
            subtitle: Text(stackTrace),
          );
  }
}

class ResponseWidget extends StatelessWidget {
  final String response;
  const ResponseWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return response != null
        ? ListTile(
            onTap: () {
              setClipBoard(context, response);
            },
            title: Text(response),
            subtitle: const Text('Response'),
          )
        : const SizedBox.shrink();
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
