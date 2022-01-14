import 'package:flutter/material.dart';
import 'package:mvvvm_app/util/constants.dart';

class AppTitle extends StatelessWidget {
  final String text;
  const AppTitle({this.text = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: color_blanco),
      ),
    );
  }
}
