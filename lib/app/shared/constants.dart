import 'package:cloud_firestore/cloud_firestore.dart';

String tokenurl = "http://3.135.87.42/UpApi/v2/api/token";
String firebaseurl = "http://192.168.1.104:51888/api/AuthMobile/connection";
String telurl = "http://192.168.1.104:51888/api/AuthValidation/validation";
String tokenresponse;
final db = FirebaseFirestore.instance;
var status;
var token;
