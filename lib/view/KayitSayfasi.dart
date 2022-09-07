import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todos_project/model/kayitol.dart';
import 'package:todos_project/view/GirisEkrani.dart';
import '../model/sizeVariables.dart';

class KayitSayafsi extends StatelessWidget {
  const KayitSayafsi({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t1 = TextEditingController();
    var t2 = TextEditingController();
    var t3 = TextEditingController();
    var t4 = TextEditingController();
    var t5 = TextEditingController();
    String sifre1;
    String sifre2;
    size_variables sizeVariables = size_variables(MediaQuery.of(context).size.height,MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt Ekranı"),
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
            TextField(
              controller: t3,
            ),
            TextField(
              controller: t4,
            ),
            TextField(
              controller: t5,
            ),
            ElevatedButton(onPressed:(){
              sifre1 = t2.text;
              sifre2 = t3.text;
              if(sifre1 != sifre2){
                showDialog(context: context, 
                builder: (context)=>AlertDialog(
                  title: Text("Şifreler eşleşmiyor."),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Tamam"))
                  ],
                ));
              }
              else if(t1.text == "a"){

              }
              else{
                kayitol(t1.text, t2.text, t3.text, t4.text, t5.text);
                Navigator.pop(context);
              }
            },child:
            Text("Kayıt ol"),),
          ],
        ),
      ),
    );
  }
}