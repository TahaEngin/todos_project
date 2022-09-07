import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todos_project/model/kayitdurum.dart';
import 'package:todos_project/model/splashKomut.dart';
import 'package:todos_project/view/AnaSayfa.dart';
import 'package:todos_project/view/GirisEkrani.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'MyHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:FutureBuilder(
        future: splash(context),
        builder: ((context,snapshot){
          if(kayitDurum == true){
            return GirisEkrani();
          }
          else{
            KullanEmail();
            return AnaSayfa();
          }
        }),),
    );
  }
}

