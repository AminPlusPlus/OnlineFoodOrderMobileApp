import 'package:flutter/material.dart';

import './myproducts.dart';
import './listProducts.dart';

class AdminPage extends StatelessWidget {

  final Function addProduct;
  final Function removeProduct;

  AdminPage(this.addProduct,this.removeProduct);

  Widget _buildSideRow (BuildContext context) {
    return Drawer(child: Column(children: <Widget>[
        AppBar(title: Text('Menus'),),
        ListTile(leading: Icon(Icons.shopping_basket),title: Text('All Products'),onTap: () {
            Navigator.pushReplacementNamed(context, '/products');
        },)
      ],),);
  }
  
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 2,child:  Scaffold(
      drawer: _buildSideRow(context),
      appBar: AppBar(
        title: (Text('Adming Panel')),
         bottom: TabBar(tabs: <Widget>[Tab(text: 'My Products',icon: Icon(Icons.book),),Tab(text: 'List Products',icon: Icon(Icons.list),)],),
      ),
      body: TabBarView(children: <Widget>[
        MyProduct(addProduct),
        ListProducts()
      ],)
    ));
  }
}
