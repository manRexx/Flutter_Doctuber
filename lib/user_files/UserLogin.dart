import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  static const String id='UserLogin';
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String get k_u_email => _uEmailController.text;
  String get k_u_password => _uPasswordController.text;

  final TextEditingController _uEmailController = TextEditingController();
  final TextEditingController _uPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
          title: Text('User App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: _uEmailController,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              obscureText: true,
              textAlign: TextAlign.center,
              controller: _uPasswordController,
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Material(
              child: MaterialButton(
                child: Text('Next',
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
