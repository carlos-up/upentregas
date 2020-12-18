import 'package:flutter/material.dart';
import 'package:upentregas/app/services/phone_auth.dart';

class LoginPage1 extends StatelessWidget {
  const LoginPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 170.0),
                child: Center(
                  child: ImageIcon(
                    AssetImage("assets/images/logo.png"),
                    //color: Colors.blue,
                    size: 210.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30.0),
                child: Center(
                  child: PhoneLogin(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
