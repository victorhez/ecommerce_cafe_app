import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPopupWidget extends StatelessWidget {
  final String title;
  final String message;
  final Map<String, dynamic> errors;
  final Function clickOkButton;

  ErrorPopupWidget({this.title, this.message, this.errors, this.clickOkButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      titleTextStyle: Theme.of(context).textTheme.headline3,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          errors != null
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: errors.entries
                .map(
                  (MapEntry<String, dynamic> e) => Text(
                e.value[0].toString(),
              ),
            )
                .toList(),
          )
              : Container(),
        ],
      ),
      contentTextStyle: Theme.of(context).textTheme.bodyText1,
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: clickOkButton != null
              ? clickOkButton
              : () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
