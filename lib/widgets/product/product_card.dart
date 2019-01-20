import 'package:flutter/material.dart';

import './location.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  ProductCard(this.product, this.index) {
    print(product.length);
    print(index);
  }

  Widget _buildRowPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTitle(product['title']),
        SizedBox(
          width: 10.0,
        ),
        PriceTag(product['price'].toString()),
      ],
    );
  }

  Widget _buildActionsButtons(BuildContext context) {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.info,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed<bool>(context, '/product/' + index.toString())
                .then((bool value) {
              if (value) {
                // this.deteleCell(index);
              }
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pushNamed<bool>(context, '/product/' + index.toString())
                .then((bool value) {
              if (value) {
                //  this.deteleCell(index);
              }
            });
          },
        ),
      ],
      alignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: _buildRowPrice(),
          ),
          LocationTag('Kulob, Tajikistan'),
          _buildActionsButtons(context)
        ],
      ),
    );
  }
}
