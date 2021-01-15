import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app_sharp,
            ),
            onPressed: () {
              _firebaseAuth.signOut();
              Get.to(
                LoginPage1(),
              );
            },
          )
        ],
        title: Text("UpEntregas"),
      ),
      body: Column(
        key: _formKey,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                inputFormatters: [maskFormatter],
                autovalidate: true,
                key: UniqueKey(),
                controller: placaController,
                decoration: InputDecoration(
                    hintText: 'Digite a placa do veiculo (ex:XXX-XXXX)'),
                validator: _validate,
                onSaved: (String val) {
                  validarForm = val;
                },
              ),
            ),
          ),
          Container(
            child: FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                if (_validate == null) {
                  Get.to(Romaneio());
                }
              },
            ),
            //child: PhoneLogin(),
          ),
          /*Center(
            child: Text(user.phoneNumber),
          ),*/
        ],
      ),
    );
  }
}
