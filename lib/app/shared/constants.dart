import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String tokenurl = "http://3.135.87.42/UpApi/v2/api/token";
String firebaseurl = "http://192.168.1.104:51888/api/AuthMobile/connection";
String telurl = "http://192.168.1.104:51888/api/AuthValidation/validation";
//String firebaseurl = "http://192.168.1.106:51888/api/AuthMobile/connection";
//String telurl = "http://192.168.1.106:51888/api/AuthValidation/validation";
String placa;
var maskFormatter = new MaskTextInputFormatter(
  mask: '###-####',
);
String tokenresponse;
final db = FirebaseFirestore.instance;
var veiculovalidation =
    db.collection('Veículos1').get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            placa = doc["Placa"];
            print(doc["Placa"]);
          })
        });
var status;
var token;
