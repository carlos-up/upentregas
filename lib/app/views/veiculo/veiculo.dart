import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:upentregas/app/models/showtoast_model.dart';
import 'package:upentregas/app/shared/constants.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';
import 'package:upentregas/app/views/login/login.dart';
import 'package:upentregas/app/views/romaneios/romaneio.dart';

class Veiculo extends StatefulWidget {
  final User user;

  Veiculo({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  _VeiculoState createState() => _VeiculoState();
}

class _VeiculoState extends State<Veiculo> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String validarForm;

  String _validate(String value) {
    if (value.trim().isEmpty) {
      return 'A placa do veiculo nao pode estar vazia';
    } else if (value.length < 8) {
      return 'Digite a placa do seu veiculo';
    } else if (value.length == 8) {
      //return 'A placa foi validada';
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut().catchError((error) {
      print(error.toString());
    });
    Get.to(LoginPage1());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        actions: <Widget>[
          /*IconButton(
            icon: Icon(
              Icons.exit_to_app_sharp,
            ),
            onPressed: () {
              signOut();
            },
          )*/
        ],
        title: Text("UpEntregas"),
      ),
      body: Column(
        children: <Widget>[
          /*Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                inputFormatters: [maskFormatter],
                autovalidate: true,
                key: UniqueKey(),
                controller: placaController,
                decoration: InputDecoration(hintText: 'XXX-XXXX'),
                validator: _validate,
                onSaved: (String val) {
                  validarForm = val;
                },
              ),
            ),
          ),*/
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                autovalidate: true,
                key: UniqueKey(),
                controller: controllerText,
                decoration: InputDecoration(hintText: 'XXX-XXXX'),
                validator: _validate,
                /*onSaved: (String val) {
                  validarForm = val;
                },*/
              ),
            ),
          ),
          Container(
            child: FloatingActionButton.extended(
              heroTag: 'btn1',
              onPressed: () {
                validarPlaca();
              },
              label: Text("Verificar placa"),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> validarPlaca() async {
    var result =
        await placaRef.where("Placa", isEqualTo: controllerText.text).get();

    if (result.docs.isEmpty) {
      showToast("A placa informada nao foi encontrada ${controllerText.text}",
          Colors.red);
      firebaseAuth.signOut();
      Timer(Duration(seconds: 5), changeScreen);
    } else {
      result.docs.forEach(
        (res) {
          print(res.data());
          Get.to(Romaneio());
        },
      );
    }
  }

  changeScreen() async {
    controllerText.clear();
    employeeController.clear();
    Get.to(
      LoginPage1(),
    );
  }
}
