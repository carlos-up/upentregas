import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String tokenurl = "http://3.135.87.42/UpApi/v2/api/token";
String firebaseurl = "http://192.168.1.104:51888/api/AuthMobile/connection";
String telurl = "http://192.168.1.104:51888/api/AuthValidation/validation";
//String firebaseurl = "http://192.168.1.106:51888/api/AuthMobile/connection";
//String telurl = "http://192.168.1.106:51888/api/AuthValidation/validation";
var maskFormatter = new MaskTextInputFormatter(
    mask: '###-####', filter: {"#": RegExp(r'[0-9]')});
String tokenresponse;
final db = FirebaseFirestore.instance;
var status;
var token;
