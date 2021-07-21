import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  LoadingWidget({this.size});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
