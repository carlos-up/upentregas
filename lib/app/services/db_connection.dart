import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upentregas/app/models/projectfirebase_model.dart';
import 'package:upentregas/app/shared/textfield_controllers.dart';

void initializeSecondary(Project project) async {
  String name = project.projectName;
  String apiKey = project.apiKey;
  String appId = project.appId;
  String projectId = project.projectId;
  String messagingSenderId = project.senderId;

  //FINAL
  /*final FirebaseOptions firebaseOptions = FirebaseOptions(
    appId: appId,
    apiKey: apiKey,
    projectId: projectId,
    messagingSenderId: messagingSenderId,
  );*/

  final FirebaseOptions firebaseOptions = const FirebaseOptions(
    appId: '1:99558546923:android:88278f146039ff46f50dae',
    apiKey: 'AIzaSyDdb1jqvPEgTxSOHUwKegD6pAhlU1qygbQ',
    projectId: 'upteste0-afba0',
    messagingSenderId:
        '99558546923-7fm5tecinipfr0klheg9tpn08qklrm8i.apps.googleusercontent.com',
  );

  /*if (Firebase.apps.length == ) {
    final String name = 'foo';
    FirebaseApp app =
        await Firebase.initializeApp(name: name, options: firebaseOptions);
    assert(app != null);
    print('Initialized $app');
  } else*/
  if (Firebase.apps.length != 0) {
    //INICIA
    final String name = 'foo';
    FirebaseApp app =
        await Firebase.initializeApp(name: name, options: firebaseOptions);
    assert(app != null);
    print('Initialized $app');
    //GRAVA
    final sharedApp = Firebase.app("foo");
    final firestore = FirebaseFirestore.instanceFor(app: sharedApp);
    firestore.collection('Identification').doc().set(
      {
        'id_cliente': employeeController.text,
      },
    );
  }

  //DELETAR PARA TESTES
  /*final String name = 'foo';
  final FirebaseApp app = Firebase.app(name);
  await app?.delete();
  print('App $name deleted');*/
}
