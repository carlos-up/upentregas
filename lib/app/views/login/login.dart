import 'package:flutter/material.dart';
import 'package:upentregas/app/repositories/token_project_repository.dart';
import 'package:upentregas/app/repositories/validation_repository.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key key}) : super(key: key);

  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
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
                  onPressed: () async {
                    tokenProject();
                    //LoginRepository().login();
                    //firebaseDetails();
                  },
                ),
                //child: PhoneLogin(),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    key: UniqueKey(),
                    controller: telefoneController,
                    //keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Digite o telefone'),
                  ),
                ),
              ),
              Container(
                child: FloatingActionButton(
                  onPressed: () async {
                    validation();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
