import 'package:flutter/material.dart';

class MyProduct extends StatefulWidget {
  final Function addProduct;

  MyProduct(this.addProduct);

  @override
  _MyProduct createState() => _MyProduct();
}

class _MyProduct extends State<MyProduct> {
  String _nameChange = '';
  String _description = '';
  double _price = 0.0;

  //decoration  Text Fields
  InputDecoration textFieldDecoration(String placeholder) {
    return InputDecoration(
      labelText: placeholder,
    );
  }

  //build title text fields
  Widget _buildTitleTextfield() {
    return TextField(
      decoration: textFieldDecoration('Name Product'),
      onChanged: (value) {
        setState(() {
          _nameChange = value;
        });
      },
    );
  }

  // Description TextField
  Widget _buildDescriptionTextfield() {
    return TextField(
      decoration: textFieldDecoration('Description'),
      maxLines: 4,
      onChanged: (value) {
        setState(() {
          _description = value;
        });
      },
    );
  }

  //build Prie Text Field
  Widget _buildPriceTextField() {
    return TextField(
        decoration: textFieldDecoration('Price'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            _price = double.parse(value);
          });
        });
  }

  void _submitForm() {
    final Map<String, dynamic> newData = {
      'title': _nameChange,
      'description': _description,
      'price': _price,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(newData);

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {

    //media Querry width
    final deviceWidth = MediaQuery.of(context).size.width;
    final widthListView = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final targetWidth = deviceWidth - widthListView;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: targetWidth),
      children: <Widget>[
        _buildTitleTextfield(),
        _buildDescriptionTextfield(),
        _buildPriceTextField(),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          textColor: Colors.white,
          child: Text('Save'),
          onPressed: _submitForm,
        )
      ],
    );
  }
}
