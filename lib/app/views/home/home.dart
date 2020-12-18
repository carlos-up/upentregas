import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upentregas/app/views/login/login.dart';

class HomePage extends StatelessWidget {
  final User user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  HomePage({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Sign out"),
            onPressed: () {
              _firebaseAuth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage1()));
            },
          ),
          Center(
            child: Text(user.phoneNumber),
          ),
        ],
      ),
    );
  }
}
