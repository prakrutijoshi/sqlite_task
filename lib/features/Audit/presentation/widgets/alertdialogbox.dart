import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> AlertDialogBox(BuildContext context, {
  required String title,
  required String content,
  String? cancleActiontext,
  required String ActionText,
}) async {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.brown),),
        content: Text(content, style: const TextStyle(color: Colors.blueGrey, fontSize: 15),),
        actions: [
          if(cancleActiontext != null)
          OutlinedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white70)),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(ActionText, style: const TextStyle(color: Colors.brown),),
          ),
          OutlinedButton(
            style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white70)),
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancleActiontext!, style: const TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if(cancleActiontext != null)
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancleActiontext),
          ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(ActionText),
        ),
      ],
    ),
  );
}