import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_word/scroll_to_word.dart';

import 'request_page.dart';

class ResponseWidget extends StatefulWidget {
  final String response;
  const ResponseWidget({super.key, required this.response});

  @override
  State<ResponseWidget> createState() => _ResponseWidgetState();
}

class _ResponseWidgetState extends State<ResponseWidget> {
  ScrollToWordController? _controller;
  final TextEditingController _textEditingController = TextEditingController();
  late String response = widget.response;
  bool isBueaty = true;
  String get text {
    if (isBueaty) {
      try {
        final decoded = jsonDecode(response);
        return JsonEncoder.withIndent('    ').convert(decoded);
      } catch (e) {
        return response;
      }
    }
    return response;
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_listen);
  }

  FocusNode _focusNode = FocusNode();
  DateTime _lastDTime = DateTime(1999);
  DateTime _lastSTime = DateTime(1999);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              _focusNode.requestFocus();
            },
            child: KeyboardListener(
              focusNode: _focusNode,
              autofocus: true,
              onKeyEvent: (value) {
                if (value.logicalKey == LogicalKeyboardKey.keyD) {
                  if (_lastDTime
                          .difference(DateTime.now())
                          .inMilliseconds
                          .abs() <
                      500) {
                    return;
                  }
                  _lastDTime = DateTime.now();
                  print('keyD');
                  next();
                }
                if (value.logicalKey == LogicalKeyboardKey.keyS) {
                  if (_lastSTime
                          .difference(DateTime.now())
                          .inMilliseconds
                          .abs() <
                      500) {
                    return;
                  }
                  _lastSTime = DateTime.now();
                  print('keyS');
                  previous();
                }
              },
              child: ScrollToWord(
                highlightedWordStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.red),
                scrollableData: text,
                onScrollerCreated: (controller) {
                  _controller = controller;
                },
              ),
            ),
          )),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _textEditingController,
              )),
              TextButton(
                  onPressed: () {
                    previous();
                  },
                  child: Icon(Icons.navigate_before)),
              TextButton(
                  onPressed: () {
                    next();
                  },
                  child: Icon(Icons.navigate_next)),
              TextButton(
                onPressed: () {
                  setState(() {
                    isBueaty = !isBueaty;
                  });
                },
                child: const Icon(Icons.format_align_justify),
              ),
              TextButton(
                onPressed: () {
                  setClipBoard(context, text);
                },
                child: const Icon(Icons.copy),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _listen() {
    final text = _textEditingController.text;
    step = 0;
    _search(text);
  }

  void _search(String _word) {
    if (_word!.length > 3) {
      final match = _word!.allMatches(text);
      if (match.isNotEmpty) {
        var matched = match.last;
        if (step != 0) {
          for (var i = 0; i < match.length; i++) {
            if (i == step) {
              matched = match.elementAt(i);
              break;
            }
          }
        }
        _controller?.scrollToWord(matched.start, matched.end);
      } else {
        print("no match");
      }
    }
  }

  int step = 0;

  void next() {
    step++;
    _search(_textEditingController.text);
  }

  void previous() {
    if (step <= 0) return;
    step--;
    _search(_textEditingController.text);
  }
}
