import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  String _email = '';
  String _password = '';
  bool isAccepts = false;
  String _urlBg =
      'https://images.unsplash.com/photo-1501155801-6ea3c8dda9e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2048&q=80';

  DecorationImage _buildBgBackgroun() {
    return DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop),
        fit: BoxFit.cover,
        image: NetworkImage(_urlBg));
  }

  Widget _buildEmailTextfield() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          labelText: 'Email',
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
      onSubmitted: (val) {
        setState(() {
          _email = val;
        });
      },
    );
  }

  Widget _buildPasswordTextfield() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          labelText: 'Password',
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
      obscureText: true,
      onSubmitted: (val) {
        setState(() {
          _password = val;
        });
      },
    );
  }

  Widget _buildAcceptBuildSwitch() {
    return SwitchListTile(
      title: Text("Accept agreement"),
      value: isAccepts,
      onChanged: (val) {
        setState(() {
          isAccepts = val;
        });
      },
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    //media Querry width
    final deviceWidth = MediaQuery.of(context).size.width;
    final widthTextField = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
            decoration: BoxDecoration(image: _buildBgBackgroun()),
            padding: EdgeInsets.all(15),
            child: Center(
                child: SingleChildScrollView(
              child: Container(
                width: widthTextField,
                  child: Column(children: [
                _buildEmailTextfield(),
                SizedBox(
                  height: 20,
                ),
                _buildPasswordTextfield(),
                SizedBox(
                  height: 20,
                ),
                _buildAcceptBuildSwitch(),
                RaisedButton(child: Text('Sign In'), onPressed: _submitForm)
              ])),
            ))));
  }
}
