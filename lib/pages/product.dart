import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/product/price_tag.dart';
import '../widgets/product/location.dart';

class Product extends StatelessWidget {
  final Map<String, dynamic> pageData;

  Product({this.pageData});

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Alet"),
              content: Text("Are you sure to delete? "),
              actions: <Widget>[
                FlatButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.pop(context)),
                FlatButton(
                  child: Text("Delete"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  },
                )
              ],
            ));
  }

  Widget _buildPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pageData['description'],
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 10,
        ),
        PriceTag(pageData['price'].toString()),
      ],
    );
  }

  Widget _scaffold(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);

          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(pageData['title']),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(pageData['image']),
              SizedBox(
                height: 10,
              ),
              _buildPriceRow(),
              LocationTag('Kulob, Tajikistan')
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }
}
