import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todos_project/model/userEmail.dart';

import '../model/sizeVariables.dart';
bool? xd;
Future<void> _isExists() async{
  QuerySnapshot<Map<String,dynamic>> _query = await FirebaseFirestore.instance.collection("users").doc(UserEmail).collection("Todos").get();
  if(_query.docs.isEmpty){
    xd =true;
  }
  else{
    xd = false;
  }
}
class Todos extends StatefulWidget {
  @override
    _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection("users").doc(UserEmail).collection("Todos").snapshots();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isExists(),
      builder:((context,snapshot){
        return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
              return Text("Something went wrong");
            
          }
    
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          if(xd != false){
              return Center(child: Text("Hiç aktiviteniz bulunmamaktadır."));
            }
          else{
            return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Center(
                child: Container(
                  child:Row(
                  children:[
                  Text(data['mission']),
                  Checkbox(value: data['state'], onChanged: (bool? value){
                    setState(() {
                      FirebaseFirestore.instance.collection("users").doc(UserEmail).collection("Todos").doc(data['mission']).update({'state':value!});;
                    });
                  })
                          ])),
              );
            }).toList(),
          );
          }
        },
      );
  })
    );
  }
}