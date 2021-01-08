import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upentregas/app/models/showtoast.dart';
import 'package:upentregas/app/services/phone_auth.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key key}) : super(key: key);

  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  //final employeeController = TextEditingController();
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('validation')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Text('Loading...');
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: TextFormField(
                            key: UniqueKey(),
                            //controller: employeeController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() async {
                                text = value;
                                final int documents =
                                    await db.snapshots().length;
                                if (text == documents.toString()) {
                                  shouldDisplay = true;
                                  print("sucess");
                                } else {
                                  shouldDisplay = false;
                                  showToast(
                                      "Codigo de empresa informado nao existe",
                                      Colors.red);
                                  print("error");
                                }
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'Digite o codigo da empresa'),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Visibility(
                visible: shouldDisplay,
                child: PhoneLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
