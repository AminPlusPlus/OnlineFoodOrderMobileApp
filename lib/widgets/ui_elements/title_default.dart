import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  final String title;
  DefaultTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
          fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
    );
  }
}
