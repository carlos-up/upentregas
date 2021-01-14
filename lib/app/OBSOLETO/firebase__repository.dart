/*import 'package:upentregas/app/models/projectfirebase.dart';
import 'package:upentregas/app/shared/constants.dart';
import 'package:upentregas/app/utils/custom_dio.dart';

class FirebaseRepository {
  Future<List<ProjectFirebase>> firebaseproject() {
    var dio = CustomDio.withAuthentication().instance;

    return dio.post(firebaseurl, data: {"COD_SISTEMA": 12}).then((res) {
      return res.data
          .map<ProjectFirebase>((c) => ProjectFirebase.fromMap(c))
          .toList() as List<ProjectFirebase>;
    }).catchError((err) => print(err));
  }
}
*/
