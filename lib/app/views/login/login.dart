import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key key}) : super(key: key);

  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  var url = "http://3.135.87.42/UpApi/v2/api";
  final employeeController = TextEditingController();
  final db = FirebaseFirestore.instance.collection('validation');
  bool shouldDisplay = false;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 130.0),
                child: Center(
                  child: ImageIcon(
                    AssetImage("assets/images/logo.png"),
                    //color: Colors.blue,
                    size: 210.0,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    key: UniqueKey(),
                    controller: employeeController,
                    //keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: 'Digite o id da empresa'),
                  ),
                ),
              ),
              Container(
                child: FloatingActionButton(
                  onPressed: () {
                    getData();
                  },
                ),
                //child: PhoneLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List> getData() async {
    String myUrl = "http://3.135.87.42/UpApi/v2/api/token";
    final teste = jsonEncode({"ID_Cliente": "${employeeController.text}"});
    http.Response response = await http.post(
      myUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: teste,
    );
    String jsonsDataString = response.body.toString();
    print(jsonsDataString);
  }
}
