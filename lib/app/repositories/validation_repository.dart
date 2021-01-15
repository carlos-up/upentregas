import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upentregas/app/models/showtoast_model.dart';
import 'package:upentregas/app/models/telefone_model.dart';
import 'package:upentregas/app/shared/constants.dart';
import 'package:upentregas/app/views/phone/phone_auth.dart';

validation(String phoneNo) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key) ?? 0;

  final PhoneLogin teste = PhoneLogin();

  if (value != null) {
    final tel = jsonEncode({"COD_SISTEMA": 12, "TELEFONE": "$phoneNo"});
    http.Response response = await http.post(
      telurl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $value',
      },
      body: tel,
    );
    print('Response body: ${response.statusCode}');
    print('Response body: ${response.body}');

    final json = jsonDecode(response.body.toString());

    // The JSON data is an array, so the decoded json is a list.
    // We will do the loop through this list to parse objects.
    if (json != null) {
      json.forEach(
        (element) {
          final validacao = Telefone.fromJson(element);
          print(validacao);
          teste.telefoneValidation(validacao, phoneNo);
        },
      );
    } else {
      showToast("", Colors.red);
    }
  }
}
