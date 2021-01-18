import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';
import 'package:upentregas/app/views/login/login.dart';

class Romaneio extends StatefulWidget {
  @override
  _RomaneioState createState() => _RomaneioState();
}

class _RomaneioState extends State<Romaneio> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
        title: Text("Romaneios"),
      ),
      body: Column(
        children: <Widget>[
          /*Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                key: UniqueKey(),
                controller: placaController,
                decoration: InputDecoration(
                    hintText: 'Digite a placa do veiculo, ex(00001234)'),
              ),
            ),
          ),
          Container(
            child: FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () async {},
            ),
            //child: PhoneLogin(),
          ),*/
          Center(
            child: Text("Tela de Romaneios"),
          ),
        ],
      ),
    );
  }
}
