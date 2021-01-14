import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upentregas/app/models/showtoast.dart';
import 'package:upentregas/app/repositories/firebase_repository.dart';
import 'dart:convert';
import 'package:upentregas/app/shared/constants.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';

void tokenProject() async {
  if (employeeController.text != '') {
    final apiencode = jsonEncode({"ID_Cliente": "${employeeController.text}"});
    http.Response response = await http.post(
      tokenurl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: apiencode,
    );
    if (response.statusCode == 200) {
      var tokenresponse = json.decode(response.body);

      print('Response body: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('${tokenresponse["token"]}');

      _save(tokenresponse["token"]);

      connection();
    }
  } else {
    showToast("favor informar o id do cliente", Colors.red);
  }
}

void _save(String token) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  prefs.setString(key, value);
}
