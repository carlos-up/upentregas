import 'package:firebase_core/firebase_core.dart';

class Db {
  static void conectarDB() async {
    final sharedApp = await Firebase.initializeApp(
      name: 'ConexaoDinamica1',
      options: FirebaseOptions(
        apiKey: 'AIzaSyBsfdHFkGHHdV0ObrNWWo0deO_iQtdCmC4',
        appId: '1:446867849337:android:26a93e1fdae35ca7f714a8',
        projectId: 'luiztestebd1',
        databaseURL: 'https://luiztestebd1.firebaseio.com/',
        messagingSenderId:
            "446867849337-s9m0h4qfr0sq6r6ko5sptlh8e8nnljll.apps.googleusercontent.com",
        storageBucket: 'flutter-sdk.appspot.com',
      ),
    );
  }
}
