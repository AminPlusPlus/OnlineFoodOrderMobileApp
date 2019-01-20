import 'package:flutter/material.dart';

import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deteleCell;

  Products(this.products, {this.deteleCell});

  Widget _buildCellList(BuildContext context, int index) {
    return ProductCard(products[index],index);
  }

  Widget _buildList() {
    Widget product;

    if (products.length > 0) {
      product = ListView.builder(
        itemBuilder: _buildCellList,
        itemCount: products.length,
      );
    } else {
      TextStyle centerStyle = TextStyle(fontSize: 23, color: Colors.blueAccent);
      product = Center(
        child: Text(
          "Add some product!",
          style: centerStyle,
        ),
      );
    }

    return product;
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}
