import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request_model/request_model.dart';
import 'package:request_viewer/pages/request/curl_widget.dart';
import 'package:request_viewer/pages/request/text_widget.dart';
import 'package:request_viewer/theme/theme.dart';

import 'response_widget.dart';

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

  RequestModel get model => widget.model;
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
            TextWidget(
              lable: 'URL',
              text: model.url,
              divided: true,
            ),
            HeadersWidget(
              headers: widget.model.headers,
            ),
            TextWidget(
              lable: 'BODY',
              text: widget.model.body,
              divided: true,
            ),
            CurlWidget(model: widget.model)
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
    return SingleChildScrollView(
      child: TextWidget(
        lable: 'STACKTRACE',
        text: stackTrace,
      ),
    );
  }
}

class HeadersWidget extends StatelessWidget {
  final Map<String, String> headers;
  const HeadersWidget({super.key, required this.headers});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      lable: 'HEADERS',
      text: headers,
      divided: true,
    );
  }
}
