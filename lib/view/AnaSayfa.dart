import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todos_project/model/splashKomut.dart';
import 'package:todos_project/view/GirisEkrani.dart';
import 'package:todos_project/viewmodel/ProfilSayfasi.dart';
import 'package:todos_project/viewmodel/ToDoEkle.dart';
import 'package:todos_project/viewmodel/ToDos.dart';
import '../model/sizeVariables.dart';
import 'package:todos_project/model/pagesList.dart';


class AnaSayfa extends StatefulWidget {
  const AnaSayfa();

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int bottomIndex = 0; 
  @override
  Widget build(BuildContext context) {
    size_variables sizeVariables = size_variables(MediaQuery.of(context).size.height,MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        actions: [
          IconButton(onPressed:(){
            showDialog(context: context, 
                builder: (context)=>AlertDialog(
                  title: Text("Çıkış yapmak istiyor musunuz?"),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Hayır")),
                    TextButton(onPressed: (() {
                      FirebaseAuth.instance.signOut().then((deger) {
                        HesapCikilmis();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => GirisEkrani()),
                        (Route<dynamic> route) => false);
                  });
                    }), child: Text("Evet"))
                  ],
                ));
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: pages[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (index)=>setState(() => bottomIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Ana Sayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.add),
          label: "Ekle"),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: "Profil"),
        ],
        ),
    );
  }
}