import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todos_project/model/splashKomut.dart';
import 'package:todos_project/model/userEmail.dart';
import 'package:todos_project/view/AnaSayfa.dart';
import 'package:todos_project/view/KayitSayfasi.dart';

import '../model/sizeVariables.dart';

class GirisEkrani extends StatelessWidget {
  const GirisEkrani({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t1 = TextEditingController();
    var t2 = TextEditingController();
    size_variables sizeVariables = size_variables(MediaQuery.of(context).size.height,MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekranı"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: t1,
            ),
            TextField(
              controller: t2,
            ),
            ElevatedButton(onPressed:(){
              FirebaseAuth.instance.signInWithEmailAndPassword(email: t1.text,password: t2.text).then((kullanici){
                UserEmail = t1.text;
                HesapGirilmis();
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_) => AnaSayfa()),(Route<dynamic> route) => false);})
                          .catchError((dynamic error){
                            if(error.code.contains('-')){
                              Fluttertoast.showToast(msg: "HATALI GİRİŞ");
                            }
                          });
            }, 
            child: Text("Giriş Yap"),
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hala kayıt olmadınız mı? Hemen "),
                    TextButton(onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> KayitSayafsi()));
                    }, child: Text("Kayıt olun.",style: TextStyle(color: Colors.blue),))
                  ],
                ),
          ],
        ),
      ),
    );
  }
}