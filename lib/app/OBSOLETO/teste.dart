import 'package:firebase_core/firebase_core.dart';

final String name = 'foo';
final FirebaseOptions firebaseOptions = const FirebaseOptions(
  appId: '1:99558546923:android:88278f146039ff46f50dae',
  apiKey: 'AIzaSyDdb1jqvPEgTxSOHUwKegD6pAhlU1qygbQ',
  projectId: 'upteste0-afba0',
  messagingSenderId:
      '99558546923-7fm5tecinipfr0klheg9tpn08qklrm8i.apps.googleusercontent.com',
);

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp();
  assert(app != null);
  print('Initialized default app $app');
}

/*Future<void> initializeSecondary() async {
  /*FirebaseApp app =
      await Firebase.initializeApp(name: name, options: firebaseOptions);
  assert(app != null);
  print('Initialized $app');*/

  final sharedApp = Firebase.app("foo");

  final firestore = FirebaseFirestore.instanceFor(app: sharedApp);
  firestore.collection('Identification').doc().set(
    {
      'id_cliente': employeeController.text,
    },
  );
}*/

void apps() {
  final List<FirebaseApp> apps = Firebase.apps;
  print('Currently initialized apps: $apps');
}

void options() {
  final FirebaseApp app = Firebase.app(name);
  final FirebaseOptions options = app?.options;
  print('Current options for app $name: $options');
}
