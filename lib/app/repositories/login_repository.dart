import 'package:shared_preferences/shared_preferences.dart';
import 'package:upentregas/app/shared/constants.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';
import 'package:upentregas/app/utils/custom_dio.dart';

class LoginRepository {
  login() {
    var dio = CustomDio().instance;

    dio.post(tokenurl, data: {"ID_Cliente": "${employeeController.text}"}).then(
        (res) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res.data['token']);
      print(res.data['token']);
    }).catchError((err) {
      throw Exception('Id da empresa invalido');
    });
  }
}
