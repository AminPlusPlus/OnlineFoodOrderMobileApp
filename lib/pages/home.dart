import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/product/products.dart';



class HomePage extends StatelessWidget {

  final List<Map<String,dynamic>> products ;


  HomePage(this.products);


  final _leftMenuBar = AppBar(
    automaticallyImplyLeading: false,
    title: Text('Selection Pages'),
  );

  Widget _buildSideRow (BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            _leftMenuBar,
            ListTile(
              title: Text('Admin Panel'),
              leading: Icon(MdiIcons.account,color: Colors.blue,)
              ,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin' );
              },
            )
          ],
        ),
      );
  }

  Widget _scaffold(BuildContext context) {
    return  Scaffold(
      drawer: _buildSideRow(context),
      appBar: AppBar(
        title: Text("Food Selector" ),
        actions: [IconButton(icon: Icon(Icons.favorite) ,onPressed: (){},)],
      ),
      body: Products(products));
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }
}
