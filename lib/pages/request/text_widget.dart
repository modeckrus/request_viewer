import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';

class TextWidget extends StatelessWidget {
  final dynamic text;
  final String lable;
  final bool divided;
  const TextWidget(
      {super.key,
      required this.lable,
      required this.text,
      this.divided = false});
  String? get textString {
    var txt = text;
    if (txt is String) {
      return txt;
    }
    if (txt is Map) {
      if (txt.isEmpty) return null;
      return JsonEncoder.withIndent('\t').convert(txt);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final str = textString;
    return str != null ? buildTile(context, str) : const SizedBox.shrink();
  }

  Widget buildTile(BuildContext context, String str) {
    Widget child = ListTile(
      onTap: () {
        setClipBoard(context, str);
      },
      title: Text(str),
      subtitle: Text(lable,
          style: TextStyle(
              fontSize: 16, color: MyTheme.of(context).textAccentColor)),
    );
    if (divided) {
      return Column(
        children: [
          child,
          Divider(),
        ],
      );
    }
    return child;
  }

  static void setClipBoard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Copied to clipboard'),
      backgroundColor: MyTheme.of(context).greenColor,
    ));
  }
}
