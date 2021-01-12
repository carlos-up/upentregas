import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ProductModel {
  final String name;
  final String price;
  ProductModel({this.name, this.price});
  Map<String, dynamic> toMap() {
    return {"name": this.name, "price": this.price};
  }
}

class Functions {
  static void conectarBD1() async {
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

  static void conectarBD2() async {
    final sharedApp = await Firebase.initializeApp(
      name: 'ConexaoDinamica2',
      options: FirebaseOptions(
        apiKey: 'AIzaSyAJdVNpu3ugQx5HHfS51UyY-xuWthjnF18',
        appId: '1:228146370031:android:5ff82d3077ef7b69d6521a',
        projectId: 'luiztestebd2',
        databaseURL: 'https://luiztestebd2.firebaseio.com/',
        messagingSenderId:
            "228146370031-hb8f6p92hoh2tcp0d63m3k2g7o8r8nhv.apps.googleusercontent.com",
        storageBucket: 'flutter-sdk.appspot.com',
      ),
    );
  }

  static void conectarBDDefauld() {
    final produto = ProductModel(name: "teste", price: "124");
    Firebase.initializeApp();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("products")
        .add(produto.toMap())
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });
  }

  static void insertObjetoBD1() {
    final produto = ProductModel(name: "teste", price: "124");
    final sharedApp = Firebase.app("ConexaoDinamica1");

    final firestore = FirebaseFirestore.instanceFor(app: sharedApp);
    firestore
        .collection("products")
        .add(produto.toMap())
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });
  }

  static void insertObjetoBD2() {
    final produto = ProductModel(name: "teste", price: "124");
    final sharedApp = Firebase.app("ConexaoDinamica2");

    final firestore = FirebaseFirestore.instanceFor(app: sharedApp);
    firestore
        .collection("products")
        .add(produto.toMap())
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });
  }

  static Future<void> signinAnonimo() async{
    //final userCredentials = await FirebaseAuth.instance.signInAnonymously();
    final sharedApp = Firebase.app("ConexaoDinamica1");
    final userCredentials = await FirebaseAuth.instanceFor(app: sharedApp).signInAnonymously();
    print('${userCredentials.user.uid}');
  }
}

class ObjetoInsBD {
  int cod;
  String descricao;

  @override
  String toString() {
    return "cod = $cod, desc = $descricao";
  }
}
