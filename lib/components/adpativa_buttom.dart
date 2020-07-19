import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdptativeButton extends StatelessWidget {
  final Function onPressed;

  AdptativeButton({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Icon(Icons.check),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
          )
        : FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: onPressed,
            backgroundColor: Color(0xFFFF691EC2),
          );
  }
}
