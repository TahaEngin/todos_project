import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todos_project/model/userEmail.dart';

import '../model/sizeVariables.dart';

class TodoEkle extends StatefulWidget {
  const TodoEkle({ Key? key }) : super(key: key);

  @override
  State<TodoEkle> createState() => _TodoEkleState();
}
var t1 = TextEditingController();
class _TodoEkleState extends State<TodoEkle> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    size_variables sizeVariables = size_variables(MediaQuery.of(context).size.height,MediaQuery.of(context).size.width);
    return Scaffold(
      body: Center(
        child: Column(children: [
          TextField(
            controller: t1,
          ),
          Checkbox(value: check, onChanged: (bool?value){
          setState(() {
            check = value!;
          });
        }),
        ElevatedButton(onPressed:(){
          setState(() {
            FirebaseFirestore.instance.collection("users").doc(UserEmail).collection("Todos").doc(t1.text).set({'mission':t1.text,'state':check});
            t1.clear();
            check = false;
          });
        }, child:
        Text("ToDo ekle"),),
        ],
        ),
      ),
    );
  }
}