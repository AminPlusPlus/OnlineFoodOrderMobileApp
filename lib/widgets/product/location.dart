import 'package:flutter/material.dart';

class LocationTag extends StatelessWidget {

  final String location;

  LocationTag(this.location);

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(3.0),
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),border: Border.all(color: Colors.grey,width: 1.0)),
            child: Text(this.location),
          );
  }
}