import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upentregas/app/models/projectfirebase_model.dart';
import 'package:upentregas/app/repositories/token_repository.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';
import 'package:upentregas/app/views/phone/phone_auth.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key key}) : super(key: key);

  @override
  _LoginPage1State createState() => _LoginPage1State();

  void initializeSecondary(Project project) async {
    String name = project.projectName;
    String apiKey = project.apiKey;
    String appId = project.appId;
    String projectId = project.projectId;
    String messagingSenderId = project.senderId;

    final FirebaseOptions firebaseOptions = const FirebaseOptions(
      appId: '1:99558546923:android:88278f146039ff46f50dae',
      apiKey: 'AIzaSyDdb1jqvPEgTxSOHUwKegD6pAhlU1qygbQ',
      projectId: 'upteste0-afba0',
      messagingSenderId:
          '99558546923-7fm5tecinipfr0klheg9tpn08qklrm8i.apps.googleusercontent.com',
    );

    /*if (Firebase.apps.length != 0) {
      //INICIA
      /*final String name = 'foo';
    FirebaseApp app =
        await Firebase.initializeApp(name: name, options: firebaseOptions);
    assert(app != null);
    print('Initialized $app');*/
      //GRAVA
      final sharedApp = Firebase.app("foo");
      final firestore = FirebaseFirestore.instanceFor(app: sharedApp);
      firestore.collection('Identification').doc().set(
        {
          'id_cliente': employeeController.text,
        },
      );
    }*/

    Get.to(
      PhoneLogin(),
    );
  }
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
                    decoration: InputDecoration(
                        hintText: 'Digite o id da empresa, ex(00001234)'),
                  ),
                ),
              ),
              Container(
                child: FloatingActionButton.extended(
                  heroTag: 'btn1',
                  onPressed: () {
                    tokenProject();
                  },
                  label: Text("Entrar"),
                ),
                //child: PhoneLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
