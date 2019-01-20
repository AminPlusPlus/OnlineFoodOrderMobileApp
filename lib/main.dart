import 'package:flutter/material.dart';

import './pages/home.dart';
import './pages/admin_pange.dart';
import './pages/product.dart';
import './pages/auth.dart';

main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];
  void addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);

      print("List product " + _products.length.toString());
    });
  }

  void removeProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light,primaryColor: Colors.blue, fontFamily: 'Oswald',buttonColor: Colors.red),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => HomePage(_products),
        '/admin': (BuildContext context) => AdminPage(addProduct, removeProduct)
      },
      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathElement = setting.name.split('/');
        if (pathElement[0] != '') {
          return null;
        }
        if (pathElement[1] == 'product') {
          final int index = int.parse(pathElement[2]);

          return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  Product(pageData: this._products[index]));
        }

        return null;
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(_products));
      },
    );
  }
}
