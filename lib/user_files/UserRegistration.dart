import 'package:flutter/material.dart';
class UserRegistration extends StatefulWidget {
  static const String id='UserRegistration';
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  String get k_u_email => _uEmailController.text;
  String get k_u_password => _uPasswordController.text;
  String get k_u_phone_number => _uPhoneController.text;
  String get k_u_emergency_contact => _uEmergencyController.text;
  String get k_u_address => _uAddressController.text;


  final TextEditingController _uEmailController = TextEditingController();
  final TextEditingController _uPasswordController = TextEditingController();
  final TextEditingController _uPhoneController = TextEditingController();
  final TextEditingController _uEmergencyController = TextEditingController();
  final TextEditingController _uAddressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(height: 10),
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller:_uPhoneController,
              decoration: InputDecoration(
                hintText: 'Enter your Phone number',
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
          Container
          (
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: _uEmergencyController,
              decoration: InputDecoration(
                hintText: 'Enter your Emergency Contact',
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
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: _uAddressController,
              decoration: InputDecoration(
                hintText: 'Enter your Address',
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
        ],
      ),
    );
  }
}
