import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upentregas/app/shared/constants.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';

void validation() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key) ?? 0;

  if (value != null) {
    final tel = jsonEncode(
        {"COD_SISTEMA": 12, "TELEFONE": "${telefoneController.text}"});
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
  }
}
