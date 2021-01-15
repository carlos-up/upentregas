import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upentregas/app/models/projectfirebase_model.dart';
import 'package:upentregas/app/services/db_connection.dart';
import 'package:upentregas/app/shared/constants.dart';
import 'package:upentregas/app/views/login/login.dart';

void connection() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key) ?? 0;

  final LoginPage1 loginPage1 = LoginPage1();

  if (value != null) {
    final sistema = jsonEncode({"COD_SISTEMA": 12});
    http.Response response = await http.post(
      firebaseurl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $value',
      },
      body: sistema,
    );
    print('Response body: ${response.statusCode}');
    print('Response body: ${response.body}');
    final json = jsonDecode(response.body.toString());

    // The JSON data is an array, so the decoded json is a list.
    // We will do the loop through this list to parse objects.
    if (json != null) {
      json.forEach((element) {
        final project = Project.fromJson(element);
        print(project);
        loginPage1.initializeSecondary(project);
      });
    }
  }
}
